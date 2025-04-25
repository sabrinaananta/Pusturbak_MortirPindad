import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'package:mortir_pindad/maps/marker_data.dart';
import 'package:http/http.dart' as http;
import 'package:mortir_pindad/pusat/compas_popup.dart';
import 'package:mortir_pindad/pusat/setting.dart';

enum CoordinateType { lco, utm } 

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}



class _MapScreenState extends State<MapScreen> {

  CoordinateType _selectedCoordinateType = CoordinateType.lco;

  final MapController _mapController = MapController();
  List<MarkerData> _markerData = [];
  List<Marker> _markers = [];
  LatLng? _selectedPosition;
  LatLng? _mylocation;
  LatLng? _draggedPosition;
  bool _isDragging = false;
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isSearching = false;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permantly denied");
    }

    return await Geolocator.getCurrentPosition();
  }

  void _showCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      LatLng currentLatlng = LatLng(position.latitude, position.longitude);
      _mapController.move(currentLatlng, 15.0);
      setState(() {
        _mylocation = currentLatlng;
      });
    } catch (e) {
      print(e);
    }
  }

  void _addMarker(LatLng position, String title, String description) {
    setState(() {
      final markerData = MarkerData(
        Position: position,
        title: title,
        description: description,
      );
      _markerData.add(markerData);
      _markers.add(
            Marker(
          point: position,
          width: 100,
          height: 100,
          builder: (context) => GestureDetector(
          onTap: () => _showMarketInfo(markerData), 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.location_on, color: Colors.redAccent, size: 40),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _showMarketDialog(BuildContext context, LatLng position) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Add Market"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(labelText: "Description"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  _addMarker(
                    position,
                    titleController.text,
                    descController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          ),
    );
  }

  void _showMarketInfo(MarkerData markerData) {
    String coordinateText;
    if (_selectedCoordinateType == CoordinateType.lco) {
      coordinateText = "Latitude: ${markerData.Position.latitude}\n"
          "Longitude: ${markerData.Position.longitude}";
    } else {
      coordinateText = _convertToUTM(markerData.Position);
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(markerData.title),
        content: Text('${markerData.description}\n\n$coordinateText'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
        ),
      ],
    ),
  );
}


  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit5';

    final Response = await http.get(Uri.parse(url));
    final data = json.decode(Response.body);

    if (data.isNotEmpty) {
      setState(() {
        _searchResults = data;
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  void _moveToLocation(double Lat, double Lon) {
    LatLng location = LatLng(Lat, Lon);
    _mapController.move(location, 15.0);
    setState(() {
      _selectedPosition = location;
      _searchResults = [];
      _isSearching = false;
      _searchController.clear();
    });
  }

  String _convertToUTM(LatLng latLng) {
  return "UTM Zone: 48M\nEasting: 123456\nNorthing: 654321";
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(() {
      _searchPlaces(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(-6.9175, 107.6191), 
              zoom: 13.0,
              onTap: (tapPosition, latLng) {
                setState(() {
                  _selectedPosition = latLng;
                  _draggedPosition = _selectedPosition;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerLayer(
                markers: _markers,
              ),
              if (_isDragging && _draggedPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _draggedPosition!,
                      width: 80,
                      height: 80,
                      builder: (context) => Icon(
                        Icons.location_on,
                        color: Colors.indigo,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              if (_mylocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _mylocation!,
                      width: 80,
                      height: 80,
                      builder: (context) => Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ],
                ),
               
            ],
          ),

          _isDragging == false
              ? Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isDragging = true;
                    });
                  },
                  child: Icon(Icons.add_location),
                ),
              )
              : Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isDragging = false;
                    });
                  },
                  child: Icon(Icons.wrong_location),
                ),
              ),

          Positioned(
        bottom: 260,
        right: 20,
        child: Column(
          children: [
            FloatingActionButton.small(
              heroTag: 'zoom_in',
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              onPressed: () {
                final currentZoom = _mapController.zoom;
                _mapController.move(_mapController.center, currentZoom + 1);
              },
              child: Icon(Icons.zoom_in, size: 20),
            ),
            SizedBox(height: 10),
            FloatingActionButton.small(
              heroTag: 'zoom_out',
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              onPressed: () {
                final currentZoom = _mapController.zoom;
                _mapController.move(_mapController.center, currentZoom - 1);
              },
              child: Icon(Icons.zoom_out, size: 20),
            ),
            SizedBox(height: 10),
            FloatingActionButton.small(
              heroTag: 'current_location',
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              onPressed: _showCurrentLocation,
              child: Icon(Icons.location_searching_rounded, size: 20),
            ),
            SizedBox(height: 10),
            Container(
        height: 40,
        width: 40,
        child: PopupMenuButton<CoordinateType>(
          tooltip: 'Pilih jenis koordinat',
          onSelected: (CoordinateType result) {
            setState(() {
              _selectedCoordinateType = result;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<CoordinateType>>[
            PopupMenuItem<CoordinateType>(
              value: CoordinateType.lco,
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 8),
                  Text('LCO'),
                ],
              ),
            ),
            PopupMenuItem<CoordinateType>(
              value: CoordinateType.utm,
              child: Row(
                children: [
                  Icon(Icons.map, size: 18),
                  SizedBox(width: 8),
                  Text('UTM'),
                ],
              ),
            ),
          ],
          icon: Icon(Icons.public, size: 20, color: Colors.white),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black, 
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),

      SizedBox(height: 10),
      FloatingActionButton.small(
        heroTag: 'setting',
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        },
        child: Icon(Icons.settings, size: 20),
      ),
      if (_isDragging)
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: FloatingActionButton.small(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            onPressed: () {
              if (_draggedPosition != null) {
                _showMarketDialog(context, _draggedPosition!);
              }
              setState(() {
                _isDragging = false;
                _draggedPosition = null;
              });
            },
            child: Icon(Icons.check, size: 20),
          ),
        ),
    ],
  ),
),
        ],
      ),
    );
  }
}
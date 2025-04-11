import 'package:flutter/material.dart';
import 'package:mortir_pindad/pusat/daftarobjek.dart';
import 'package:mortir_pindad/pusat/daftartembak.dart';
import 'package:mortir_pindad/pusat/datasasaran.dart';
import 'package:mortir_pindad/pusat/setting.dart';
import 'package:mortir_pindad/maps/mapscreen.dart';
import 'package:intl/intl.dart';
import 'package:mortir_pindad/pusat/chat_popup.dart';
import 'package:mortir_pindad/pusat/image_popup.dart';
import 'package:mortir_pindad/pusat/weather_popup.dart';


class MainPusatPage extends StatelessWidget {
  const MainPusatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isNavBarVisible = false;
  bool _isSMSVisible = false;
  bool _isWeatherVisible = false;
  bool _isDataSasaranVisible = false;
  bool _isDaftarTembakVisible = false;
  bool _showCompass = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        
          const MapScreen(),

        
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey.shade900,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statusGroup(
                    backgroundColor: Colors.black,
                    children: const [
                      Icon(Icons.circle, color: Colors.green, size: 12),
                      SizedBox(width: 4),
                      Text('CCU', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  _statusGroup(
                    backgroundColor: Colors.white,
                    children: [
                      Image.asset(
                        'asset/img/pusturbak.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 4),
                      const Text('6133 2876', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                 _statusGroup(
                    backgroundColor: Colors.white,
                    children: [
                      Image.asset(
                        'asset/img/Kopucuk.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'KO PUCUK',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  _statusGroup(
                    backgroundColor: Colors.black,
                    children: [
                      Image.asset(
                        'asset/img/amunisi.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 4),
                      const Text('100/', style: TextStyle(color: Colors.red)),
                      const Text('200/', style: TextStyle(color: Colors.orange)),
                      const Text('300', style: TextStyle(color: Colors.amber)),
                    ],
                  ),

                  _statusGroup(
                    backgroundColor: Colors.black,
                    children: const [
                      Icon(Icons.battery_full, color: Colors.white),
                      SizedBox(width: 2),
                      Text('CCU 100%', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 8),
                      Icon(Icons.battery_full, color: Colors.white),
                      SizedBox(width: 2),
                      Text('DISPLAY 100%',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  _statusGroup(
                  backgroundColor: Colors.grey,
                  children: [
                    Image.asset(
                      'asset/img/calendar.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '071559 FEB 2025',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                ],
              ),
            ),
          ),

          //Sidebar kiri
          Positioned(
            left: 10,
            top: 80,
            child: Column(
              children: [
                _menuButton(Icons.chat, "Chat", () {
                  setState(() {
                    _isSMSVisible = !_isSMSVisible;
                  });
                }),
                _menuButton(Icons.cloud, "Weather", () {
                  setState(() {
                    _isWeatherVisible = !_isWeatherVisible;
                  });
                }),
                _menuButton(Icons.photo_library, "Galeri Tembak", () {
                  setState(() {
                    _isDataSasaranVisible = !_isDataSasaranVisible;
                  });
                }),
                _menuButton(Icons.list, "Targets", () {
                  setState(() {
                    _isDaftarTembakVisible = !_isDaftarTembakVisible;
                  });
                }),
                _menuButton(Icons.explore, "Kompas", () {
                  setState(() {
                    _showCompass = !_showCompass;
                  });
                }),

              ],
            ),
          ),

          
          if (_isSMSVisible)
            Positioned(
              left: 80,
              top: 120,
              child:
                  SMSPage(onClose: () => setState(() => _isSMSVisible = false)),
            ),
          if (_isWeatherVisible)
            Positioned(
              left: 80,
              top: 120,
              child: CuacaPage(
                  onClose: () => setState(() => _isWeatherVisible = false)),
            ),
          if (_isDataSasaranVisible)
            Positioned(
              left: 80,
              top: 120,
              child: DataSasaranPage(
                  onClose: () => setState(() => _isDataSasaranVisible = false)),
            ),
          if (_isDaftarTembakVisible)
            Positioned(
              left: 80,
              top: 120,
              child: DaftarTembakPage(
                  onClose: () =>
                      setState(() => _isDaftarTembakVisible = false)),
            ),

          if (_showCompass)
            Positioned(
              bottom: 16,
              right: 16,
              child: CompassWidget(),
            ),
        ],
      ),
    );
  }

  Widget _statusGroup(
      {required Color backgroundColor, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }

  Widget _menuButton(IconData icon, String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  
}
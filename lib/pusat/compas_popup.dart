import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

class CompassWidget extends StatefulWidget {
  @override
  _CompassWidgetState createState() => _CompassWidgetState();
}

class _CompassWidgetState extends State<CompassWidget> {
  double _direction = 0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      // basic kalkulasi
      double direction = math.atan2(event.y, event.x) * (180 / math.pi);
      setState(() {
        _direction = direction;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -_direction * (math.pi / 180),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70,
          border: Border.all(color: Colors.black),
        ),
        child: const Icon(Icons.explore, size: 50, color: Colors.blue),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CuacaPage extends StatelessWidget {
  final VoidCallback onClose;

  const CuacaPage({required this.onClose, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,   
      height: 500, 
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF3A3A3A), 
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2), 
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
     
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color:
                  Color.fromARGB(255, 0, 0, 0), 
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CUACA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: onClose,
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

    
          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.6, 
              children: [
                _buildWeatherCard(
                    "Temperatur", "000000°C", FeatherIcons.thermometer),
                _buildWeatherCard(
                    "Kelembapan", "12.3% RH", FeatherIcons.droplet),
                _buildWeatherCard(
                    "Arah Mata Angin", "12.344°", FeatherIcons.wind),
                _buildWeatherCard(
                    "Tekanan Udara", "1.2hPa", FeatherIcons.trendingDown),
                _buildWeatherCard(
                    "Kecepatan Angin", "56.7m/S", FeatherIcons.flag),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildWeatherCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0), 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xFF00FF00), size: 40), 
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF00),
            ),
          ),
        ],
      ),
    );
  }
}
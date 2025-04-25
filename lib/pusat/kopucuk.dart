import 'package:flutter/material.dart';

class InputKoPucukPopup extends StatelessWidget {
  final TextEditingController idPucukController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController altitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Masukan Posisi Pucuk',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField('ID Pucuk', idPucukController),
            _buildTextField('Latitude Pucuk', latitudeController),
            _buildTextField('Longitude Pucuk', longitudeController),
            _buildTextField('Altitude Pucuk', altitudeController),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
          child: Text('BATAL'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
    
            Navigator.of(context).pop();
          },
          child: Text('SIMPAN'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

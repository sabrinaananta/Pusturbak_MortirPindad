import 'package:flutter/material.dart';

// komponen utama 
class InformasiPerangkatDialog extends StatelessWidget {
  const InformasiPerangkatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF3C3C3C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFFFC400), width: 1),
      ),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16),
        // dibikin scroll
        child: SingleChildScrollView(  
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Informasi Perangkat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(color: Color(0xFFFFC400)),
              const SizedBox(height: 8),
              _buildSectionTitle("Aplikasi Sisbak"),
              _buildInfoRow("Aplikasi Sisbak", ":"),
              _buildInfoRow("Build Number", ": 25.02.13 15:57:35"),
              const SizedBox(height: 16),
              _buildSectionTitle("Unit Display"),
              _buildInfoRow("OS Versi", ": 8.1.0"),
              _buildInfoRow("Layar", ": OPM1.171019.026release-keys"),
              _buildInfoRow("Resolusi", ": {2070, 1080}"),
              _buildInfoRow("Kapasitif", ": Capacitive Multi Touch"),
              _buildInfoRow("Antarmuka", ": T91EUE1"),
              _buildInfoRow("Versi Incremental", ": T91_4.4.1"),
              _buildInfoRow("SDK", ": 27"),
              _buildInfoRow("Board", ": sdm945"),
              _buildInfoRow("User", ": Root"),
              const SizedBox(height: 16),
              _buildSectionTitle("Unit Kontrol"),
              _buildInfoRow("Kernel", ": Linux 4.14.78-hdte-k100+"),
              _buildInfoRow("Arsitektur", ": armv7l"),
              _buildInfoRow("Processor", ": armv7l"),
              _buildInfoRow("RAM", ": 516 MB"),
              _buildInfoRow("Penyimpanan Internal", ": 3660771"),
              _buildInfoRow("Status", ": Aktif"),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC400),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
                    // aksi untuk tombol Status Sensor ditekan
                  },
                  child: const Text(
                    "Status Sensor",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C1C1C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

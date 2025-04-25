import 'package:flutter/material.dart';
import 'package:mortir_pindad/pusat/pengaturanakun.dart';
import 'package:mortir_pindad/pusat/perkakas.dart';

class DataPerangkatPage extends StatelessWidget {
  const DataPerangkatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 750,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Pengaturan (Sisbak Mortir)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),

              // BODY
              Expanded(
                child: Row(
                  children: [
                    // Sidebar
                    Container(
                      width: 170,
                      padding: const EdgeInsets.only(top: 20, left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sidebarItem(Icons.person, "Pengguna", false, () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PengaturanSisbakMortirPage()),
                            );
                          }),
                          sidebarItem(Icons.devices, "Data Perangkat", true, () {
                          }),
                          sidebarItem(Icons.build, "Perkakas", false, () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PerkakasPage()),
                            );
                          }),
                        ],
                      ),

                    ),

                    // Konten Tengah
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Data Perangkat",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(),
                              const SizedBox(height: 10),

                              const Text(
                                "Identitas",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),

                              Container(
                                color: Colors.cyan[50],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Grup",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),

                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "ID",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Controller",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(height: 8),

                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {},
                                  child: const Text("Ubah Identitas"),
                                ),
                              ),

                              const SizedBox(height: 20),
                              const Text(
                                "Komunikasi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Long Range Radio",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              const Divider(),
                              const SizedBox(height: 8),

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: SizedBox.shrink()),
                                    DataColumn(label: SizedBox.shrink()),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(Text('Jenis')),
                                      DataCell(Text('Serial (Radio Internal)')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Poll Timeout (detik)')),
                                      DataCell(Text('2.0')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Poll Interval (detik)')),
                                      DataCell(Text('5.0')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Daftar Node')),
                                      DataCell(Text('.Observer1')),
                                    ]),
                                  ],
                                  headingRowColor: MaterialStatePropertyAll(
                                    Color(0xFFE0E0E0),
                                  ),
                                  border: TableBorder.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  dataRowMinHeight: 40,
                                  dataRowMaxHeight: 50,
                                ),
                              ),

                              const SizedBox(height: 20),
                              const Text(
                                "Short Range Radio",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              const Divider(),
                              const SizedBox(height: 8),

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: SizedBox.shrink()),
                                    DataColumn(label: SizedBox.shrink()),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(Text('Jenis')),
                                      DataCell(Text('Serial (Radio Internal)')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Poll Timeout (detik)')),
                                      DataCell(Text('2.0')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Poll Interval (detik)')),
                                      DataCell(Text('5.0')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Daftar Node')),
                                      DataCell(Text('.Observer1')),
                                    ]),
                                  ],
                                  headingRowColor: MaterialStatePropertyAll(
                                    Color(0xFFE0E0E0),
                                  ),
                                  border: TableBorder.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  dataRowMinHeight: 40,
                                  dataRowMaxHeight: 50,
                                ),
                              ),

                              // === Tambahan baru setelah Short Range Radio ===

                              const SizedBox(height: 20),
                              const Text(
                                "Interoperabilitas",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),

                              Container(
                                color: Colors.cyan[50],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Aktif",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Alamat Perangkat",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("-"),
                                ],
                              ),

                              const Divider(),
                              const SizedBox(height: 8),

                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {},
                                  child: const Text("Pengaturan Interoperabilitas"),
                                ),
                              ),

                              const SizedBox(height: 20),

                              const Text(
                                "Isi berkas konfigurasi",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),

                              const Icon(Icons.keyboard_arrow_down, size: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sidebarItem(IconData icon, String title, bool isSelected, VoidCallback onTap) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
    ),
    child: ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: onTap, 
    ),
  );
}
}

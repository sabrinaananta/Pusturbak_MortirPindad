import 'package:flutter/material.dart';
import 'package:mortir_pindad/pusat/dataperangkat.dart';
import 'package:mortir_pindad/pusat/pengaturanakun.dart';

class PerkakasPage extends StatelessWidget {
  const PerkakasPage({Key? key}) : super(key: key);

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
                    ),
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
                          sidebarItem(Icons.person, "Pengguna", false, context),
                          sidebarItem(Icons.devices, "Data Perangkat", false, context),
                          sidebarItem(Icons.build, "Perkakas", true, context),
                        ],
                      ),
                    ),

                    // Konten Tengah
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Perkakas",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(),
                              const SizedBox(height: 10),

                              // STATUS LAYANAN
                              Container(
                                width: double.infinity,
                                color: Colors.cyan[50],
                                padding: const EdgeInsets.all(12),
                                child: const Text(
                                  "Status Layanan",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              DataTable(
                                columnSpacing: 40,
                                columns: const [
                                  DataColumn(label: Text('Status')),
                                  DataColumn(label: Text('Nama layanan')),
                                ],
                                rows: [
                                  serviceRow(true, "Sisbak Mortir"),
                                  serviceRow(true, "Interoperability"),
                                  serviceRow(true, "Web Configuration"),
                                  serviceRow(true, "CCU Display"),
                                ],
                              ),

                              const SizedBox(height: 20),

                              // TITIK AKSES
                              Container(
                                width: double.infinity,
                                color: Colors.cyan[50],
                                padding: const EdgeInsets.all(12),
                                child: const Text(
                                  "Titik Akses",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Table(
                                border: TableBorder.all(color: Colors.black),
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(3),
                                },
                                children: const [
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("SSID", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("SM3-3C"),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Frekuensi", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("5 GHz"),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Channel", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("153 (5765 MHz)"),
                                    ),
                                  ]),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[800],
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    // TODO: Aksi atur frekuensi
                                  },
                                  child: const Text('Atur Frekuensi'),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // ETHERNET
                              Container(
                                width: double.infinity,
                                color: Colors.cyan[50],
                                padding: const EdgeInsets.all(12),
                                child: const Text(
                                  "Ethernet",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Table(
                                border: TableBorder.all(color: Colors.black),
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(3),
                                },
                                children: const [
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Auto-negotiation", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Aktif"),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Kecepatan", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("10Mb/s"),
                                    ),
                                  ]),
                                ],
                              ),

                              // === BAGIAN TAMBAHAN DARI GAMBAR ===
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                color: Colors.cyan[50],
                                padding: const EdgeInsets.all(12),
                                child: const Text(
                                  "Data Perangkat",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Table(
                                border: TableBorder.all(color: Colors.black),
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(3),
                                },
                                children: const [
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Part Number", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("TA-CCU008"),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("No. Serial", style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("CCU009-H24-003"),
                                    ),
                                  ]),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[800],
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    // TODO: Aksi atur seri perangkat
                                  },
                                  child: const Text('Atur Seri Perangkat'),
                                ),
                              ),

                              const SizedBox(height: 20),
const Text("Pembaruan Perangkat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
const SizedBox(height: 10),

// PEMBARUAN
const Text("Pembaruan"),
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black54),
  ),
  child: Row(
    children: [
      Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: const Text("Choose File"),
      ),
      const Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("No File chosen"),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 16),

// CHECKSUM
const Text("Checksum"),
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black54),
  ),
  child: Row(
    children: [
      Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: const Text("Choose File"),
      ),
      const Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("No File chosen"),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 20),

// TOMBOL ATUR PERANGKAT
Container(
  width: double.infinity,
  color: Colors.cyan[50],
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
  child: Align(
    alignment: Alignment.centerRight,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        // TODO: Tambahkan aksi pembaruan perangkat
      },
      child: const Text("Atur Perangkat"),
    ),
  ),
),
// === INFORMASI PERANGKAT ===
const SizedBox(height: 20),
Container(
  width: double.infinity,
  color: Colors.cyan[50],
  padding: EdgeInsets.all(12),
  child: Text(
    "Informasi Perangkat",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
),
const SizedBox(height: 10),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Text("kernel", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("Linux 4.14.78-hdte-k100+"),
    SizedBox(height: 12),
    
    Text("CCU", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("Freescale i. mx6 Ultralite (Device Tree)"),
    SizedBox(height: 12),

    Text("RAM", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("492.3M (516165632 B)"),
    SizedBox(height: 12),

    Text("Penyimpanan", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("/dev/root/3.5G"),
    SizedBox(height: 12),

    Text("Alamat dan Rute IP", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("192.168.0.0/24 dev wlan0 proto kernel scope link src 192.168.0.1"),
    Text("192.168.0.0/24 dev eth1 proto kernel scope link src 192.168.1.1 linkdown"),
  ],
),
const SizedBox(height: 20),
const Text(
  "Versi Citra",
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 10),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Text("Sisbakmortir – 20230530", style: TextStyle(fontWeight: FontWeight.bold)),
    SizedBox(height: 8),
    Text("update – 20230530 -> update – 20230821"),
    Text("update – 20230530 -> update – 20230821"),
    Text("update – 20230530 -> update – 20230821"),
    Text("update – 20230530 -> update – 20230821"),
  ],
),

const SizedBox(height: 20),
Container(
  width: double.infinity,
  color: Colors.cyan[50],
  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
  child: Align(
    alignment: Alignment.centerRight,
    child: ElevatedButton(
      onPressed: () {
        // TODO: Tambahkan aksi restart perangkat
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Nyalakan Ulang Perangkat',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),


                        
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

  Widget sidebarItem(IconData icon, String title, bool isSelected, BuildContext context) {
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
        onTap: () {
          if (title == "Pengguna") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PengaturanSisbakMortirPage()),
            );
          } else if (title == "Data Perangkat") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DataPerangkatPage()),
            );
          }
        },
      ),
    );
  }

  static DataRow serviceRow(bool isActive, String serviceName) {
    return DataRow(cells: [
      DataCell(
        Icon(
          Icons.circle,
          color: isActive ? Colors.limeAccent.shade400 : Colors.red,
          size: 20,
        ),
      ),
      DataCell(
        Text(
          serviceName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}

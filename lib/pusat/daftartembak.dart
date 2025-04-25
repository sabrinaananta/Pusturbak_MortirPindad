import 'package:flutter/material.dart';

class DaftarTembakPage extends StatelessWidget {
  final VoidCallback onClose;

  const DaftarTembakPage({required this.onClose, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataTembak = List.generate(4, (index) => {
          'arah': '402',
          'jarak': '2399',
          'elevasi': '1240',
          'jenis': 'Tajam',
          'jenisMunisi': '4',
          'id': '1718356388933',
        });

    return Container(
      width: 400,
      height: 450,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Data Sasaran Diterima",
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
          Expanded(
            child: ListView.builder(
              itemCount: dataTembak.length,
              itemBuilder: (context, index) {
                final item = dataTembak[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            
                              Row(
                                children: [
                                  Text(
                                    'No.${index + 1}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.arrow_upward, size: 16),
                                ],
                              ),
                              SizedBox(height: 8),
                        
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  item['id'] ?? '',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(height: 8),
                              // Data Detail
                              Row(
                                children: [
                                  Expanded(child: Text('Arah')),
                                  Expanded(child: Text('Elevasi')),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item['arah'] ?? '',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item['elevasi'] ?? '',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(child: Text('Jarak SAS')),
                                  Expanded(child: Text('Jenis Munisi')),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item['jarak'] ?? '',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item['jenisMunisi'] ?? '',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('Jenis Munisi'),
                              SizedBox(height: 2),
                              Text(
                                item['jenis'] ?? '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                  
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

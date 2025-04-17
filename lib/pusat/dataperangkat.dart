import 'package:flutter/material.dart';

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
                      "Data Perangkat",
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
                              color: Colors.grey.shade400, width: 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.person, color: Colors.blue),
                            title: Text("Pengguna",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          ListTile(
                            leading: Icon(Icons.devices, color: Colors.blue),
                            title: Text("Data Perangkat",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          ListTile(
                            leading: Icon(Icons.build, color: Colors.black),
                            title: Text("Perkakas"),
                          ),
                        ],
                      ),
                    ),

                    // Konten Tengah (Main Content Area)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Daftar Perangkat",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: Colors.black),
                            const SizedBox(height: 10),

                            // List of devices (you can populate with actual data)
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5, // Replace with actual number of devices
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    leading: Icon(Icons.devices, color: Colors.blue),
                                    title: Text("Perangkat ${index + 1}"),
                                    subtitle: Text("Status: Online"),
                                    trailing: Icon(Icons.more_vert),
                                    onTap: () {
                                      // Implement onTap action, e.g., navigate to device details page
                                    },
                                  ),
                                );
                              },
                            ),

                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Build 25.02.13 15:57:35",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                          ],
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
}

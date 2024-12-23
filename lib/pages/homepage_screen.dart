import 'package:app_cari_rumahsakit/controller/homepage_controller.dart';
import 'package:app_cari_rumahsakit/model/RumahSakit_Model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List dataRumahSakit = [];
  String hasilCekPencarian = '';
  TextEditingController inputController = TextEditingController();

  // Ambil data dari API
  void ambilData () async {
    List dataRS = await GetDataRsController().getData();
    setState(() {
      dataRumahSakit = dataRS;
    });
  }

  // Proses Cek Validasi
  bool cekNamaRumahSakit(String nama) {
    return dataRumahSakit.any((rs) => rs.name.toLowerCase() == nama.toLowerCase());
  }

  void cekPencarian () {
    String userInput = inputController.text;
    bool isValid = cekNamaRumahSakit(userInput);
    // bool isValid = dataRumahSakit.contains(userInput);

    // Debug userInput dan isValid
    print('_____________________________');
    // print(dataRumahSakit);
    print(userInput);
    print(isValid);
    // print(dataRumahSakit[0]);

    setState(() {
      hasilCekPencarian = isValid
      ? 'Data ditemukan'
      : 'Data tidak ditemukan';
    });
  }

  void _refreshPage() {
    setState(() {
      _counter = 0;
    }
    );
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Aplikasi Cari Rumah Sakit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),  
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cari Data Rumah Sakit',
                style: TextStyle(
                  fontSize: 24,
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0), // Padding di dalam card
                    child: Column( // Posisi elemen di column
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: inputController,
                                decoration: InputDecoration(
                                  labelText: 'Masukkan nama rumah sakit'
                                ),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,0,0) ,
                              child: ElevatedButton(
                                onPressed: () {
                                  cekPencarian();
                                },
                                  // var hasil = await GetDataRsController().getData();
                                  // print(hasil);
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                              child: const Text(
                                'Cari',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                            )
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,10,0,0),
                          child:  Text(hasilCekPencarian, style: TextStyle(fontSize: 16)),
                        ),
                        // Expanded(
                        //   child: filteredRumahSakit.isEmpty
                        //       ? Center(child: CircularProgressIndicator())
                        //       : ListView.builder(
                        //           itemCount: filteredRumahSakit.length,
                        //           itemBuilder: (context, index) {
                        //             return ListTile(
                        //               title: Text(filteredRumahSakit[index].name),
                        //               subtitle: Text(filteredRumahSakit[index].address),
                        //               onTap: () {
                        //                 Menampilkan dialog saat item dipilih
                        //                 showDetailDialog(filteredRumahSakit[index]);
                        //               },
                        //             );
                        //           },
                        //         ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshPage,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

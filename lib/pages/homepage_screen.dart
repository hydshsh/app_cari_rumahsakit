import 'package:app_cari_rumahsakit/controller/get_data_rs_controller.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
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
                            const Expanded(
                              child: TextField() 
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,0,0) ,
                              child: ElevatedButton(
                                onPressed: () async {
                                  var hasil = await GetDataRsController().getData();
                                  print(hasil[4]);
                                },
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0,10,0,0),
                          child:  Text('Data ditemukan atau tidak', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

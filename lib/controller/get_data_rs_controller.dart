import 'package:app_cari_rumahsakit/config/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Kalau Controller buat ambil data dari API itu bentukannya kurang lebih gini, ada pake :
// - import package:http as http
// - import dart:convert
// - Future
// - async
// - Uri.parse
// - await
// - decode (pake aja ini selalu biar paham)
// - json.decode
// - response.body

// class GetDataRsController {
//   // Bikin function Future dalam bentuk List dynamic atau sesuai class Modelnya yang ambil data secara async
//   Future<List<dynamic>>getData() async {

//     // bikin variabel namanya linkApi untuk simpan sementara hasil parse link
//     // dari class API di api.dart + .sesuai nama static string lokasi datanya di api yg dibuat
//     var linkApi = Uri.parse(API.rumahSakit);

//     // Deklarasi List dynamic yang dikasih nama dataRumahSakit, isi List awalnya kosong aja jadi cuma []
//     List<dynamic> dataRumahSakit = [];

//     // Kirim request get ke api lewat http pake variabel linkApi yang tadi udah di ngeparse dari link 
//     // di dalemnya nanti ada function untuk ngedecode dari format link URI ke format tipe data string/int/bool/double
//     await http.get(linkApi).then((response) async {
//       // Bikin variabel decode untuk tempat sementara hasil decode URI ke tipe data lainnya, disini pake var biar
//       // otomatis nentuin sendiri itu string/int/bool
//       var decode = await json.decode(response.body);
//       // Lakuin perulangan buat masukin datanya, jadi nanti datanya punya index 0-sekian
//       // cara nentuin dalam satu index ada apa aja itu mapping nya ada di dalam Modelnya, itu fungsi Model
//       for(var i = 0; i < decode.length; i++){
//         // Datanya dimasukin ke variabel dalam bentuk List yang tadi udah dibuat yaitu dataRumahSakit
//         // Cara masukin datanya pake .add(variabel decode yang tadi dipake buat tempat sementara hasil decode format data)
//         dataRumahSakit.add(decode[i]);
//       }
//     },);
//     // Return ke dataRumahSakit yang tadi dipake buat naruh data yang disimpan ke variabel
//     return dataRumahSakit;
//   }
// }

class GetDataRsController {
  Future<List<dynamic>>getData() async {
    var linkApi = Uri.parse(API.rumahSakit);
    List<dynamic> dataRumahSakit = [];

    await http.get(linkApi).then((response) async {
      var decode = await json.decode(response.body);
      
      for(var i = 0; i < decode.length; i++){
        dataRumahSakit.add(decode[i]);
      }
    },);
    return dataRumahSakit;
  }
}
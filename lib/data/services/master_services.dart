part of 'services.dart';

class MasterServices {
  /**
   PELAJARAN !!!

   KALAU SUDAH ADA ID PROVINSI, DI LINK URI PARSENYA, JANGAN LUUPING DAN 
   PAKAI IF LAGI KALAU AMBIL DATA DETAIL PROVINSI/KAB/KEC NYA.

   HEADERNYA ENGGAK USAH DIISI APAPUN, KARENA API KEYNYA SUDAH DIMASUKKIN KE 
   LINK
   **/

  //engggak mau (enggak bisa) pakai https
  // static Future<List<Provinsi>> getProvinsi() async {
  //   //apikey nya sbg parameter, bukan sbg header
  //   var response = await http.get(
  //       Uri.https(
  //           Const().baseUrl, "/wilayah/provinsi?api_key=${Const().apiKey}"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'key': Const().apiKey
  //       });

  //   var responseBody = json.decode(response.body); //decode hasil response body

  //   //link kan data ke model provinsi
  //   List<Provinsi> provinsi = [];

  //   if (response.statusCode == 200) {
  //     //datanya ada di value, buat from jsonnya
  //     provinsi = (responseBody["value"] as List)
  //         .map((e) => Provinsi.fromJson(e))
  //         .toList();
  //   }
  //   print(response);
  //   print("===========");
  //   print(provinsi);
  //   return provinsi;
  // }

  static Future<List<Provinsi>> getProvinsi() async {
    //apikey nya sbg parameter, bukan sbg header

    //cara dapatin api keynya, langsung saja daftar ke https://binderbyte.com/auth/login
    var response = await http.get(
        Uri.parse(
            "https://${Const().baseUrl}/wilayah/provinsi?api_key='MASUKKIN API KEY KAMU DISINI'"),
        headers: <String, String>{
          //'Content-Type': 'application/json; charset=UTF-8',
          //'key': Const().apiKey
        });

    var responseBody = json.decode(response.body); //decode hasil response body
    print(responseBody);

    //link kan data ke model provinsi
    List<Provinsi> provinsi = [];

    if (response.statusCode == 200) {
      //datanya ada di value, buat from jsonnya
      provinsi = (responseBody["value"] as List)
          .map((e) => Provinsi.fromJson(e))
          .toList();
    }
    print("entahlah");
    print(response);
    print("===========");
    print(provinsi);
    return provinsi;
  }

  static Future<List<Kabupaten>> getKabupaten(String idProv) async {
    var response = await http.get(
        Uri.parse(
            "https://api.binderbyte.com/wilayah/kabupaten?api_key='MASUKKIN API KEY KAMU DISINI'&id_provinsi=$idProv"),
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          //'key': Const().apiKey
        });

    print("ini response");
    print(response);
    print("Uri parse");
    print(Uri.parse(
        "https://api.binderbyte.com/wilayah/kabupaten?api_key='MASUKKIN API KEY KAMU DISINI'&id_provinsi=$idProv"));

    var responseBody = json.decode(response.body);

    List<Kabupaten> semuaKabupaten = [];

    //e = element
    // for (var e in semuaKabupaten) {
    //   if (response.statusCode == 200) {
    //     //masukkan data semua kabupaten dari api ke var semua kabupaten
    //     semuaKabupaten = (responseBody["value"] as List)
    //         .map((e) => Kabupaten.fromJson(e))
    //         .toList();
    //   }
    // }
    if (response.statusCode == 200) {
      //masukkan data semua kabupaten dari api ke var semua kabupaten
      semuaKabupaten = (responseBody["value"] as List)
          .map((e) => Kabupaten.fromJson(e))
          .toList();
    }
    return semuaKabupaten;
  }

  //salah disini guys :D
  // List<Kabupaten> selectedKabupaten = json.decode(responseBody);
  // List<Kabupaten> selectedKabupaten = [];

  // for (var e in semuaKabupaten) {
  //   //jika id provinsi di semua kabupaten = id prov yang dipilih
  //   //maka masukkan data semua kabupaten ke selectedkab
  //   if (e.idProvinsi == idProv) {
  //     selectedKabupaten.add(e);
  //   }
  // }

  // return selectedKabupaten;
  //}

  static Future<List<Kecamatan>> getKecamatan(String idKab) async {
    var response = await http.get(
        Uri.parse(
            "https://api.binderbyte.com/wilayah/kecamatan?api_key='MASUKKIN API KEY KAMU DISINI'&id_kabupaten=$idKab"),
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          // 'key': Const().apiKey
        });

    var response_body = json.decode(response.body);

    List<Kecamatan> semuaKecamatan = [];

    if (response.statusCode == 200) {
      semuaKecamatan = (response_body["value"] as List)
          .map((e) => Kecamatan.fromJson(e))
          .toList();
    }

    return semuaKecamatan;

    // for (var e in semuaKecamatan) {
    //   if (response.statusCode == 200) {
    //     semuaKecamatan = (response_body["value"] as List)
    //         .map((e) => Kecamatan.fromJson(e))
    //         .toList();
    //   }
    // }

    // List<Kecamatan> selectedKecamatan = [];

    // for (var e in semuaKecamatan) {
    //   if (e.idKabupaten == idKab) {
    //     selectedKecamatan.add(e);
    //   }
    // }

    // //menampilkan data kecamatan yang dipilih berdasarkan id kab
    // return selectedKecamatan;
  }

  static Future<List<Kelurahan>> getKelurahan(dynamic idKec) async {
    var response = await http.get(
        Uri.parse(
            "https://api.binderbyte.com/wilayah/kelurahan?api_key='MASUKKIN API KEY KAMU DISINI'&id_kecamatan=$idKec"),
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          // 'key': Const().apiKey
        });

    var response_body = json.decode(response.body);

    List<Kelurahan> semuaKelurahan = [];

    if (response.statusCode == 200) {
      semuaKelurahan = (response_body["value"] as List)
          .map((e) => Kelurahan.fromJson(e))
          .toList();
    }

    return semuaKelurahan;

    // for (var e in semuaKelurahan) {
    //   if (response.statusCode == 200) {
    //     semuaKelurahan = (response_body["value"] as List)
    //         .map((e) => Kelurahan.fromJson(e))
    //         .toList();
    //   }
    // }

    // List<Kelurahan> selectedKelurahan = [];

    // for (var e in semuaKelurahan) {
    //   if (e.idKecamatan == idKec) {
    //     selectedKelurahan.add(e);
    //   }
    // }

    // return selectedKelurahan;
  }
}

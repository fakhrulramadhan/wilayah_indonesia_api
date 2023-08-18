import 'package:flutter/material.dart';
import 'package:wilayah_indonesia_api/data/model/model.dart';
import 'package:wilayah_indonesia_api/data/services/services.dart';
import 'package:wilayah_indonesia_api/presentation/widgets/ui_loading.dart';

class WilayahScreen extends StatefulWidget {
  const WilayahScreen({super.key});

  @override
  State<WilayahScreen> createState() => _WilayahScreenState();
}

class _WilayahScreenState extends State<WilayahScreen> {
  bool isLoading = false;

  dynamic idProv;
  dynamic provinsiData;
  dynamic selectedProv;
  dynamic idKab;
  dynamic kabupatenData;
  dynamic selectedKabupaten;
  dynamic idKec;
  dynamic kecamatanData;
  dynamic selectedKecamatan;
  dynamic idKel;
  dynamic kelurahanData;
  dynamic selectedKelurahan;

  Future<List<Provinsi>> getProvinsi() async {
    dynamic listProvinsi;
    await MasterServices.getProvinsi().then((value) {
      setState(() {
        listProvinsi = value;
      });
    });
    return listProvinsi;
  }

  Future<List<Kabupaten>> getKabupaten(String idProv) async {
    dynamic listKabupaten;

    await MasterServices.getKabupaten(idProv).then((value) {
      setState(() {
        listKabupaten = value;
      });
    });

    return listKabupaten;
  }

  Future<List<Kecamatan>> getKecamatan(String idKab) async {
    dynamic listKecamatan;

    await MasterServices.getKecamatan(idKab).then((value) {
      setState(() {
        listKecamatan = value;
      });
    });

    return listKecamatan;
  }

  Future<List<Kelurahan>> getKelurahan(String idKec) async {
    dynamic listKelurahan;

    await MasterServices.getKelurahan(idKec).then((value) {
      setState(() {
        listKelurahan = value;
      });
    });

    return listKelurahan;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    provinsiData = getProvinsi();
    print("data provinsi");
    print(provinsiData);
    print("hahhaha");
    // kabupatenData = getKabupaten(idProv!);
    // print(kabupatenData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wilayah Indonesia API"),
          actions: const [],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Provinsi",
                                style: TextStyle(
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      //pantesan error, enggak pakai width :(
                                      width: 150,
                                      child: FutureBuilder<List<Provinsi>>(
                                        future: provinsiData,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return DropdownButton(
                                              isExpanded: true,
                                              value: selectedProv,
                                              icon: const Icon(
                                                Icons.arrow_drop_down_circle,
                                                size: 24.0,
                                              ),
                                              iconSize: 35,
                                              elevation: 20,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.0,
                                              ),
                                              hint: selectedProv == null
                                                  ? const Text(
                                                      "Pilih Provinsi Asal")
                                                  : Text(selectedProv.name),
                                              items: snapshot.data!.map<
                                                      DropdownMenuItem<
                                                          Provinsi>>(
                                                  (Provinsi value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(
                                                      value.name.toString()),
                                                );
                                              }).toList(),
                                              //ketika dipilih, data berubah
                                              onChanged: (newValue) {
                                                setState(() {
                                                  //list kosong selectprov
                                                  //diisi new value
                                                  selectedProv = newValue;

                                                  //ambil data id provinsi yang baru
                                                  idProv = selectedProv.id;
                                                });

                                                //idKab = null;
                                                //selectkab null digunain utk
                                                //kalau mau ganti provinsi,
                                                //kab yg dipilihnya harus null
                                                //dulu
                                                selectedKabupaten = null;
                                                //mendapatkan id provinsi yang
                                                //dimasukan ke get dalam daftar kota
                                                kabupatenData =
                                                    getKabupaten(idProv);
                                                print(idProv);
                                                print("Data kabupaten");
                                                print(selectedKabupaten);
                                              },
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Text(
                                              "Tidak ada data",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            );
                                          }

                                          return UiLoading.loadingDD();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: selectedProv == null
                                    ? const Text("Pilih Provinsi asal dulu")
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child:
                                                FutureBuilder<List<Kabupaten>>(
                                              future: kabupatenData,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return DropdownButton(
                                                    isExpanded: true,
                                                    value: selectedKabupaten,
                                                    icon: const Icon(
                                                      Icons
                                                          .arrow_drop_down_circle,
                                                      size: 24.0,
                                                    ),
                                                    iconSize: 32,
                                                    elevation: 17,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                    hint: selectedKabupaten ==
                                                            null
                                                        ? const Text(
                                                            "Pilih Kab asal")
                                                        : Text(selectedKabupaten
                                                            .name),
                                                    items: snapshot.data!.map<
                                                            DropdownMenuItem<
                                                                Kabupaten>>(
                                                        (Kabupaten value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value.name
                                                            .toString()),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        selectedKabupaten =
                                                            newValue;

                                                        idKab =
                                                            selectedKabupaten
                                                                .id;
                                                      });

                                                      selectedKecamatan = null;
                                                      //mendapatkan id provinsi yang
                                                      //dimasukan ke get dalam daftar kota
                                                      kecamatanData =
                                                          getKecamatan(idKab);
                                                    },
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return const Text(
                                                    "Tidak ada data",
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                    ),
                                                  );
                                                }

                                                return UiLoading.loadingDD();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Kecamatan",
                                style: TextStyle(
                                  fontSize: 21.0,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: FutureBuilder<List<Kecamatan>>(
                                        future: kecamatanData,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return DropdownButton(
                                              items: snapshot.data!.map<
                                                      DropdownMenuItem<
                                                          Kecamatan>>(
                                                  (Kecamatan value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text("${value.name}"),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedKecamatan = newValue;

                                                  idKec = selectedKecamatan.id;
                                                });

                                                selectedKelurahan = null;

                                                kelurahanData =
                                                    getKelurahan(idKec);
                                              },
                                              isExpanded: true,
                                              value: selectedKecamatan,
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                size: 24.0,
                                              ),
                                              iconSize: 30,
                                              elevation: 22,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                              hint: selectedKecamatan == null
                                                  ? const Text(
                                                      "Pilih Kecamatan")
                                                  : Text(
                                                      "${selectedKecamatan.name}"),
                                            );
                                          }
                                          return UiLoading.loadingDD();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: selectedKecamatan == null
                                    ? const Text("Pilih Kecamatan dulu")
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child:
                                                FutureBuilder<List<Kelurahan>>(
                                              future: kelurahanData,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return DropdownButton(
                                                    items: snapshot.data!.map<
                                                            DropdownMenuItem<
                                                                Kelurahan>>(
                                                        (Kelurahan value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(
                                                            "${value.name}"),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        selectedKelurahan =
                                                            newValue;
                                                        idKel =
                                                            selectedKelurahan
                                                                .id;
                                                      });

                                                      //  selectedKelurahan = null;

                                                      // kelurahanData =
                                                      //   getKelurahan(idKec);
                                                    },
                                                    isExpanded: true,
                                                    value: selectedKelurahan,
                                                    icon: const Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 24.0,
                                                    ),
                                                    hint: selectedKelurahan ==
                                                            null
                                                        ? const Text(
                                                            "Pilih Kelurahan")
                                                        : Text(
                                                            "${selectedKelurahan.name}"),
                                                  );
                                                }
                                                return UiLoading.loadingDD();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}

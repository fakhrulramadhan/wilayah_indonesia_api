part of 'model.dart';

class Kabupaten {
  String? id;
  String? idProvinsi;
  String? name;

  Kabupaten({
    this.id,
    this.idProvinsi,
    this.name,
  });

  Kabupaten copyWith({
    String? id,
    String? idProvinsi,
    String? name,
  }) =>
      Kabupaten(
        id: id ?? this.id,
        idProvinsi: idProvinsi ?? this.idProvinsi,
        name: name ?? this.name,
      );

  factory Kabupaten.fromRawJson(String str) =>
      Kabupaten.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Kabupaten.fromJson(Map<String, dynamic> json) => Kabupaten(
        id: json["id"],
        idProvinsi: json["id_provinsi"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_provinsi": idProvinsi,
        "name": name,
      };
}

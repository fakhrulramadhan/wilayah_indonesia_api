part of 'model.dart';

class Kecamatan {
  String? id;
  String? idKabupaten;
  String? name;

  Kecamatan({
    this.id,
    this.idKabupaten,
    this.name,
  });

  Kecamatan copyWith({
    String? id,
    String? idKabupaten,
    String? name,
  }) =>
      Kecamatan(
        id: id ?? this.id,
        idKabupaten: idKabupaten ?? this.idKabupaten,
        name: name ?? this.name,
      );

  factory Kecamatan.fromRawJson(String str) =>
      Kecamatan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        id: json["id"],
        idKabupaten: json["id_kabupaten"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kabupaten": idKabupaten,
        "name": name,
      };
}

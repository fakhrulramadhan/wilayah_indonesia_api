part of 'model.dart';

class Kelurahan {
  String? id;
  String? idKecamatan;
  String? name;

  Kelurahan({
    this.id,
    this.idKecamatan,
    this.name,
  });

  Kelurahan copyWith({
    String? id,
    String? idKecamatan,
    String? name,
  }) =>
      Kelurahan(
        id: id ?? this.id,
        idKecamatan: idKecamatan ?? this.idKecamatan,
        name: name ?? this.name,
      );

  factory Kelurahan.fromRawJson(String str) =>
      Kelurahan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        id: json["id"],
        idKecamatan: json["id_kecamatan"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kecamatan": idKecamatan,
        "name": name,
      };
}

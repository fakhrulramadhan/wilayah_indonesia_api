part of 'model.dart';

class Provinsi {
  String? id;
  String? name;

  Provinsi({
    this.id,
    this.name,
  });

  Provinsi copyWith({
    String? id,
    String? name,
  }) =>
      Provinsi(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Provinsi.fromRawJson(String str) =>
      Provinsi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

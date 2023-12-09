import 'dart:convert';

Crop cropFromJson(String str) => Crop.fromJson(json.decode(str));

String cropToJson(Crop data) => json.encode(data.toJson());

class Crop {
  Crop({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Crop.fromJson(Map<String, dynamic> json) => Crop(
        id: json["id"],
        name: json["name"] ?? "null",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

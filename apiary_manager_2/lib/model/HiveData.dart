// To parse this JSON data, do
//
//     final hive = hiveFromJson(jsonString);

import 'dart:convert';

List<Hive> hivesFromJson(String str) =>
    List<Hive>.from(json.decode(str).map((x) => Hive.fromJson(x)));

String hivesToJson(List<Hive> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Hive hiveFromJson(String str) => Hive.fromJson(json.decode(str));

String hiveToJson(Hive data) => json.encode(data.toJson());

class Hive {
  Hive({
    required this.id,
    required this.name,
    required this.description,
    required this.dateOfCreation,
    required this.dateOfModification,
    required this.size,
    required this.deleted,
    required this.queen,
    required this.apiary,
  });

  int id;
  String name;
  String description;
  DateTime dateOfCreation;
  DateTime dateOfModification;
  int size;
  bool deleted;
  int queen;
  int apiary;

  factory Hive.fromJson(Map<String, dynamic> json) => Hive(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        dateOfCreation: DateTime.parse(json["date_of_creation"]),
        dateOfModification: DateTime.parse(json["date_of_modification"]),
        size: json["size"],
        deleted: json["deleted"],
        queen: json["queen"],
        apiary: json["apiary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "date_of_creation": dateOfCreation.toIso8601String(),
        "date_of_modification": dateOfModification.toIso8601String(),
        "size": size,
        "deleted": deleted,
        "queen": queen,
        "apiary": apiary,
      };
}

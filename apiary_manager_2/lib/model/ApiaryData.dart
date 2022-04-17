import 'dart:convert';

List<Apiary> apiaryFromJson(String str) =>
    List<Apiary>.from(json.decode(str).map((x) => Apiary.fromJson(x)));

String apiaryToJson(List<Apiary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apiary {
  Apiary({
    required this.id,
    required this.name,
    required this.dateOfCreation,
    required this.dateOfModification,
    required this.description,
    required this.location,
    required this.humidity,
    required this.sunExposure,
    required this.deleted,
  });

  int id;
  String name;
  DateTime dateOfCreation;
  DateTime dateOfModification;
  String description;
  String location;
  int humidity;
  int sunExposure;
  bool deleted;

  factory Apiary.fromJson(Map<String, dynamic> json) => Apiary(
        id: json["id"],
        name: json["name"],
        dateOfCreation: DateTime.parse(json["date_of_creation"]),
        dateOfModification: DateTime.parse(json["date_of_modification"]),
        description: json["description"],
        location: json["location"],
        humidity: json["humidity"],
        sunExposure: json["sun_exposure"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date_of_creation": dateOfCreation.toIso8601String(),
        "date_of_modification": dateOfModification.toIso8601String(),
        "description": description,
        "location": location,
        "humidity": humidity,
        "sun_exposure": sunExposure,
        "deleted": deleted,
      };
}

// To parse this JSON data, do
//
//     final platesResponse = platesResponseFromMap(jsonString);

import 'dart:convert';

class PlatesResponse {
  PlatesResponse({
    required this.description,
    required this.price,
    required this.id,
    this.link,
    required this.creation,
    required this.name,
  });

  String description;
  int price;
  int id;
  String? link;
  DateTime creation;
  String name;

  factory PlatesResponse.fromJson(String str) =>
      PlatesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlatesResponse.fromMap(Map<String, dynamic> json) => PlatesResponse(
        description: json["description"],
        price: json["price"],
        id: json["id"],
        link: json["link"],
        creation: DateTime.parse(json["creation"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "price": price,
        "id": id,
        "link": link,
        "creation": creation.toIso8601String(),
        "name": name,
      };
}

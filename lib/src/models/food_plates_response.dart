// To parse this JSON data, do
//
//     final foodPlatesResponse = foodPlatesResponseFromMap(jsonString);

import 'dart:convert';

class PlateResponse {
  PlateResponse({
    this.previousPage,
    this.nextPage,
    required this.total,
    required this.pages,
    this.data,
  });

  int? previousPage;
  int? nextPage;
  int total;
  int pages;
  List<FoodPlatesResponse>? data;

  factory PlateResponse.fromJson(String str) =>
      PlateResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlateResponse.fromMap(Map<String, dynamic> json) => PlateResponse(
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        total: json["total"],
        pages: json["pages"],
        data: List<FoodPlatesResponse>.from(
            json["data"].map((x) => FoodPlatesResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "previous_page": previousPage,
        "next_page": nextPage,
        "total": total,
        "pages": pages,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class FoodPlatesResponse {
  FoodPlatesResponse({
    required this.name,
    required this.price,
    required this.description,
    required this.link,
    required this.id,
    // this.creation,
  });

  String name;
  int price;
  String description;
  String link;
  int id;
  // DateTime? creation;

  factory FoodPlatesResponse.fromJson(String str) =>
      FoodPlatesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FoodPlatesResponse.fromMap(Map<String, dynamic> json) =>
      FoodPlatesResponse(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        link: json["link"],
        id: json["id"],
        // creation: DateTime.parse(json["creation"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "description": description,
        "link": link,
        "id": id,
        // "creation": creation!.toIso8601String(),
      };
}

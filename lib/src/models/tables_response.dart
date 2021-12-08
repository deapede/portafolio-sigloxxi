// To parse this JSON data, do
//
//     final tablesResponse = tablesResponseFromMap(jsonString);

import 'dart:convert';

class TablesResponse {
  TablesResponse({
    this.previousPage,
    this.nextPage,
    required this.total,
    required this.pages,
    required this.data,
  });

  dynamic previousPage;
  dynamic nextPage;
  int total;
  int pages;
  List<StatusMesa> data;

  factory TablesResponse.fromJson(String str) =>
      TablesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TablesResponse.fromMap(Map<String, dynamic> json) => TablesResponse(
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        total: json["total"],
        pages: json["pages"],
        data: List<StatusMesa>.from(
            json["data"].map((x) => StatusMesa.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "previous_page": previousPage,
        "next_page": nextPage,
        "total": total,
        "pages": pages,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class StatusMesa {
  StatusMesa({
    required this.number,
    required this.status,
    required this.userId,
    required this.id,
  });

  int number;
  bool status;
  int userId;
  int id;

  factory StatusMesa.fromJson(String str) =>
      StatusMesa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusMesa.fromMap(Map<String, dynamic> json) => StatusMesa(
        number: json["number"],
        status: json["status"],
        userId: json["user_id"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "status": status,
        "user_id": userId,
        "id": id,
      };
}

// To parse this JSON data, do
//
//     final createOrderResponse = createOrderResponseFromMap(jsonString);

import 'dart:convert';

class CreateOrderResponse {
  CreateOrderResponse({
    required this.tableId,
    required this.statusId,
    required this.creation,
    required this.ordersDetail,
  });

  int tableId;
  int statusId;
  DateTime creation;
  List<OrdersDetail> ordersDetail;

  factory CreateOrderResponse.fromJson(String str) =>
      CreateOrderResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateOrderResponse.fromMap(Map<String, dynamic> json) =>
      CreateOrderResponse(
        tableId: json["table_id"],
        statusId: json["status_id"],
        creation: DateTime.parse(json["creation"]),
        ordersDetail: List<OrdersDetail>.from(
            json["orders_detail"].map((x) => OrdersDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "table_id": tableId,
        "status_id": statusId,
        "creation": creation.toIso8601String(),
        "orders_detail": List<dynamic>.from(ordersDetail.map((x) => x.toMap())),
      };
}

class OrdersDetail {
  OrdersDetail({
    required this.foodPlateId,
    required this.quantity,
    required this.status,
  });

  int foodPlateId;
  int quantity;
  String status;

  factory OrdersDetail.fromJson(String str) =>
      OrdersDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersDetail.fromMap(Map<String, dynamic> json) => OrdersDetail(
        foodPlateId: json["food_plate_id"],
        quantity: json["quantity"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "food_plate_id": foodPlateId,
        "quantity": quantity,
        "status": status,
      };
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sigloxxi/src/global/conexion.dart';
import 'package:sigloxxi/src/models/models.dart';

Future<http.Response> createOrder(
  int tableId,
  int statusId,
  List<OrdersDetail> orderDetail,
) async {
  final orden = {
    'table_id': tableId,
    'status_id': statusId,
    // 'creation': DateTime.now(),
    'orders_details': orderDetail
  };

  final response = await http.post(
    Uri.parse('${Conexion.apiUrl}/v1/food_plates/orders_create_ocd/'),
    body: json.encode(orden),
  );
  print(response.body);
  return response;
}

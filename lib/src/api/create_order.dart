import 'package:http/http.dart' as http;
import 'package:sigloxxi/src/global/conexion.dart';
import 'package:sigloxxi/src/models/models.dart';

Future<http.Response> createOrder(
  int tableId,
  int statusId,
  DateTime date,
  List<Map<String, dynamic>> orderDetail,
) async {
  final response = await http.post(
    Uri.parse('${Conexion.apiUrl}/v1/food_plates/orders_create_ocd/'),
    body: {
      'table_id': tableId,
      'status_id': statusId,
      'creation': DateTime.now(),
      'orders_details': orderDetail
    },
  );
  return response;
}

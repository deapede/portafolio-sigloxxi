import 'package:http/http.dart' as http;
import 'package:sigloxxi/src/global/conexion.dart';

Future<http.Response> getAllTables() async {
  final response = await http.get(
    Uri.parse('${Conexion.apiUrl}/v1/tables/get_all_tables/?page=1'),
  );

  return response;
}

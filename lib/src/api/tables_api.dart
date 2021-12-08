import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sigloxxi/src/global/conexion.dart';

Future<http.Response> getAllTables() async {
  final response = await http.get(
    Uri.parse('${Conexion.apiUrl}/v1/tables/get_all_tables/?page=1'),
  );

  return response;
}

Future<http.Response> updateTablesStatus(
    int numeroMesa, bool status, int userId, int idMesa) async {
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final token = await secureStorage.read(key: 'token');

  final body = {
    'number': numeroMesa,
    'status': status,
    'user_id': userId,
    'id': idMesa,
  };

  final response = await http.put(
    Uri.parse('${Conexion.apiUrl}/v1/tables/update_tables/'),
    headers: {'token': token.toString(), 'Content-Type': 'application/json'},
    body: json.encode(body),
  );
  print(response.body);
  return response;
}

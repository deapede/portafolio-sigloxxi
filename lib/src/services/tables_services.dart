import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sigloxxi/src/api/tables_api.dart';
import 'package:sigloxxi/src/models/models.dart';

class TablesService extends ChangeNotifier {
  List<StatusMesa> tables = [];

  TablesService() {
    getTables();
  }

  Future getTables() async {
    final response = await getAllTables();

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final tablesResponse = TablesResponse.fromMap(jsonData);
      tables = tablesResponse.data;
      tables.sort((a, b) => a.number.compareTo(b.number));

      // print(table.);
      notifyListeners();
    }
  }

  Future<void> handleRefresh() async {
    getTables();
  }

  Future<Response> updtTables(
      int numeroMesa, bool status, int userId, int idMesa) async {
    final response =
        await updateTablesStatus(numeroMesa, status, userId, idMesa);

    handleRefresh();
    notifyListeners();

    return response;
  }
}

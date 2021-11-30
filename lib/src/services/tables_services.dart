import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sigloxxi/src/api/tables_api.dart';

Future getTables() async {
  final response = await getAllTables();

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
  }
}

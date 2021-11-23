import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sigloxxi/src/global/conexion.dart';
import 'package:sigloxxi/src/models/models.dart';

import 'package:sigloxxi/src/services/services.dart';

class FoodPlateService extends ChangeNotifier {
  List<PlatesResponse> foodPlates = [];

  FoodPlateService() {
    getAllFoodPlates();
  }

  ///
  Future<void> getAllFoodPlates() async {
    final response = await http.get(Uri.parse(
        '${Conexion.apiUrl}/v1/food_plates/get_all_food_plates_wjwt/'));

    if (response.statusCode == 200) {
      final bodyData = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonData = json.decode(bodyData);
      foodPlates = jsonData.map((e) => PlatesResponse.fromMap(e)).toList();
      notifyListeners();
    }
  }
}

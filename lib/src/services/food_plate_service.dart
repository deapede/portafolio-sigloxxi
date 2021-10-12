import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sigloxxi/src/global/conexion.dart';
import 'package:sigloxxi/src/models/food_plates_response.dart';

import 'package:sigloxxi/src/services/services.dart';

class FoodPlateService extends ChangeNotifier {
  List<PlateResponse> foodPlates = [];

  FoodPlateService() {
    this.getAllFoodPlates();
  }

  getAllFoodPlates() async {
    final token = await LoginService.getToken();

    final response = await http.get(
      Uri.parse('${Conexion.apiUrl}/v1/food_plates/get_all_food_plates?page=1'),
      headers: {
        'token': token!,
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final platesResponse = PlateResponse.fromJson(response.body);
      this.foodPlates.add(platesResponse);
      notifyListeners();
    }
  }
}

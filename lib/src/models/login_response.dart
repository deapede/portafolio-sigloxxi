// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.rolId,
    required this.rolName,
    required this.userId,
  });

  String accessToken;
  String tokenType;
  int rolId;
  String rolName;
  String userId;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        rolId: json["rol_id"],
        rolName: json["rol_name"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "rol_id": rolId,
        "rol_name": rolName,
        "user_id": userId,
      };
}

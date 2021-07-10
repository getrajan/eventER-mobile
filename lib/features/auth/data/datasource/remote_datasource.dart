import 'dart:convert';

import 'package:eventer_app/core/constant/api_constant.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/errors/exception.dart';
import 'package:eventer_app/features/auth/domain/model/user_hive_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login({required Map<String, dynamic> data});

  Future<String> register({required Map<String, dynamic> data});
}

class IAuthRemoteDataSource implements AuthRemoteDataSource {
  final http.Client client;

  IAuthRemoteDataSource(this.client);

  @override
  Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> data}) async {
    Uri _loginUrl = Uri.parse(BASE_URL + "/users/login");
    final loginResponse = await client.post(_loginUrl, body: data);
    if (loginResponse.statusCode == 200) {
      final data = jsonDecode(loginResponse.body);
      return data;
    } else if (loginResponse.statusCode >= 400 &&
        loginResponse.statusCode < 500) {
      final error = jsonDecode(loginResponse.body);
      throw FailException(message: error['message']);
    } else if (loginResponse.statusCode >= 500) {
      final error = jsonDecode(loginResponse.body);
      throw ServerException(message: error['message']);
    } else {
      throw ServerException(message: UNKNOWN_ERROR);
    }
  }

  @override
  Future<String> register({required Map<String, dynamic> data}) async {
    Uri _registerUrl = Uri.parse(BASE_URL + "/users/signUp");
    final registerResponse = await client.post(_registerUrl, body: data);
    if (registerResponse.statusCode == 200) {
      final data = jsonDecode(registerResponse.body);
      return data['token'];
    } else if (registerResponse.statusCode >= 400 &&
        registerResponse.statusCode < 500) {
      final error = jsonDecode(registerResponse.body);
      throw FailException(message: error['message']);
    } else if (registerResponse.statusCode > 500) {
      final error = jsonDecode(registerResponse.body);
      throw ServerException(message: error['message']);
    } else {
      throw ServerException(message: UNKNOWN_ERROR);
    }
  }
}

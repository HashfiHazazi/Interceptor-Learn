// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_auth/src/features/login/application/services/login_interceptor.dart';
import 'package:flutter_auth/src/features/login/data/repositories/login_repository.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';

class LoginService with LoginInterceptor implements LoginRepository {
  // ignore_for_file: avoid_print
  final String _loginUrl = '/auth/login-mobile';

  @override
  Future<void> saveToken(Map<String, dynamic> tokenMap) async {
    final token = tokenMap['data']['token'];
    await LoginSharedPreferences.setToken(token);
  }

  @override
  Future<void> saveUserId(Map<String, dynamic> userIdMap) async {
    final userId = userIdMap['data']['user_id'];
    await LoginSharedPreferences.setUserId(userId);
  }

  @override
  Future<void> saveCode(String code) async {
    await LoginSharedPreferences.setCode(code);
  }
  
  @override
  Future<bool> dioLogin(
      String codevalue, String usernamevalue, String passwordValue) async {
    try {
      final _dio = await loginInterceptor();
      Response response = await _dio.post(
        _loginUrl,
        options: Options(headers: {'code': codevalue}),
        data: {"username": usernamevalue, "password": passwordValue},
      );
      print('Headers: ${response.headers}');
      print('Response: ${response.data}');
      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        await saveUserId(response.data);
        await saveCode(codevalue);
        await saveToken(response.data);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print("ERROR FROM DIO EXCEPTION : ${e.toString()}");
      if (e.response != null) {
        print('Error data: ${e.response}');
      }
      return false;
    }
  }
}

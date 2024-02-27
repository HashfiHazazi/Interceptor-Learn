import 'package:dio/dio.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

mixin LoginInterceptor {
  // ignore_for_file: avoid_print
  var option = BaseOptions(
    baseUrl: 'http://103.82.242.180:1440/api/v1',
  );
  Future<Dio> dioInterceptor() async {
    Dio dio = Dio(option);
    dio.interceptors.clear();
    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          print("CALL ON REQUEST");
          //kalau tidak kosong dapetin code dari Lokal/SharedPreferences
          final code = await LoginSharedPreferences.getCode();
          if (code != null) {
            request.headers['code'] = code;
          }
          //kalau tidak kosong dapetin access token dari Lokal/SharedPreferences
          final accessToken = await LoginSharedPreferences.getToken();
          if (accessToken != null) {
            request.headers['Authorization'] = 'Bearer $accessToken';
          }
          print("LEWAT");
          return handler.next(request);
        },
        onError: (error, handler) {
          print("Stack trace Error: ${error.stackTrace}");
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 400) {
            print(
                "ERROR : ${error.response?.statusCode} ${error.response?.statusMessage}");
          }
          return handler.next(error);
        },
      ),
    );
    return dio;
  }
}

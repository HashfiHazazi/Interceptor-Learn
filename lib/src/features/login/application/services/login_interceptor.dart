import 'package:dio/dio.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

mixin LoginInterceptor {
  // ignore_for_file: avoid_print
  var option = BaseOptions(
    baseUrl: 'http://103.82.242.180:1440/api/v1',
  );

  final _refreshTokenUrl = '/auth/refresh-token-mobile';

  Future<Dio> loginInterceptor() async {
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
        maxWidth: 90,
      ),
    );

    Future<void> setNewAccessToken(
        Map<String, dynamic> newAccessTokenMap) async {
      final newAccessToken = newAccessTokenMap['data']['token'];
      await LoginSharedPreferences.setToken(newAccessToken);
    }

    Future<void> setNewRefreshToken(
        Map<String, dynamic> newRefreshTokenMap) async {
      final newRefreshToken = newRefreshTokenMap['data']['refresh_token'];
      await LoginSharedPreferences.setRefreshToken(newRefreshToken);
    }

    //Funtion to get new Access token & new Refresh token
    Future<bool> fetchNewToken() async {
      Response response = await dio.post(
        _refreshTokenUrl,
        data: {"refresh_token": await LoginSharedPreferences.getRefreshToken()},
        options: Options(
          headers: {
            "code": await LoginSharedPreferences.getCode(),
          },
        ),

      );
      print('Refresh Token API data: ${response.data}');
      print('Response Message: ${response.data['message']}');
      try {
        if (response.data['message'] == "Berhasil Membuat Token Baru") {
          await setNewAccessToken(response.data);
          await setNewRefreshToken(response.data);
          return true;
        } else {
          return false;
        }
      } on DioException catch (e) {
        print('Get Refresh Token Error ${e.toString()}');
        return false;
      }
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          print("CALL ON REQUEST");

          final code = await LoginSharedPreferences.getCode();
          if (code != null && code.isNotEmpty) {
            request.headers["code"] = code;
          }

          final accessToken = await LoginSharedPreferences.getToken();
          if (accessToken != null && accessToken.isNotEmpty) {
            request.headers["Authorization"] = "Bearer $accessToken";
          }
          print("LEWAT");
          return handler.next(request);
        },
        onError: (error, handler) async {
          print("Stack trace Error: ${error.stackTrace}");
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 400) {
            //If error occured because token expired, get the new Access token & new Refresh token from refresh token API & save that value to local storage
            await fetchNewToken();
          }
          return handler.next(error);
        },
      ),
    );
    return dio;
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_auth/src/features/login/application/services/login_interceptor.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';
import 'package:flutter_auth/src/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_auth/src/features/profile/domain/models/profile_model.dart';

class ProfileService with LoginInterceptor implements ProfileRepository {
  @override
  Future<ProfileModel> fetchProfile() async {
    final getUserId = await LoginSharedPreferences.getUserId();
    const String _profileUrl = '/mobile-api/profile';
    
    Dio _dio = await loginInterceptor();

    final profileResponse = await _dio.get(
      _profileUrl,
      queryParameters: {"user_id": getUserId, "type": 1},
    );

    final profileResult = profileResponse.data["data"];
    print(profileResult);
    ProfileModel profileList = ProfileModel.fromJson(profileResult);
    return profileList;
  }
}

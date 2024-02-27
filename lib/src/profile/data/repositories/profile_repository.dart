import 'package:flutter_auth/src/profile/domain/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> fetchProfile();
}

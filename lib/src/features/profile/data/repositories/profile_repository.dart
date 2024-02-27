import 'package:flutter_auth/src/features/profile/domain/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> fetchProfile();
}

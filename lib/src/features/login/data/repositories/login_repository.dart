abstract class LoginRepository {
  Future<bool> dioLogin(
      String codevalue, String usernamevalue, String passwordValue);

  Future<void> saveToken(Map<String, dynamic> tokenMap);

  Future<void> saveUserId(Map<String, dynamic> userIdMap);

  Future<void> saveCode(String code);

  Future<void> saveRefreshToken(Map<String, dynamic> refreshTokenMap);
}

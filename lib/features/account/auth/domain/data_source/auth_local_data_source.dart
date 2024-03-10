abstract class AuthLocalDataSource {
  Future<bool> saveAuthToken(String token);
  Future<String> getAuthToken();
  Future<bool> deleteAuthToken();
}

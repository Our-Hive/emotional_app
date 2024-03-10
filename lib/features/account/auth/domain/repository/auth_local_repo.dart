abstract class AuthLocalRepo {
  Future<bool> saveAuthToken(String token);
  Future<String> getAuthToken();
  Future<bool> deleteAuthToken();
}

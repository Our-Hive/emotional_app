class LoginApiResponse {
  final String token;

  LoginApiResponse({
    required this.token,
  });

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) {
    return LoginApiResponse(
      token: json['access_token'],
    );
  }
}

class LoginModel {
  final String? accesToken;
  final String? refreshToken;

  LoginModel({required this.accesToken, required this.refreshToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accesToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}

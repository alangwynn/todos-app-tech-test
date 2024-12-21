
class LoginResponseModel {

  LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] != null ? json['token'] as String : '',
    );
  }

  String token;

}

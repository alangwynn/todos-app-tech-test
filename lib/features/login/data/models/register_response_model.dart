
class RegisterResponseModel {

  RegisterResponseModel({
    required this.id,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      id: json['id'] != null ? json['id'] as num : 0,
      token: json['token'] != null ? json['token'] as String : '',
    );
  }

  factory RegisterResponseModel.empty() {
    return RegisterResponseModel(
      id: 0,
      token: '',
    );
  }

  final num id;
  final String token;

}

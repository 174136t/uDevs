class LoginModel {
  final String userType;
  final String token;
  final String email;
  final int userId;

  LoginModel(this.userType, this.token, this.email, this.userId);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userType = json['user']['user_type'],
        token = json['token'],
        email = json['user']['email'],
        userId = json['user']['id'];

  Map<String, dynamic> toJson() =>
      {
        'user_type': userType,
        'token': token,
        'email': email,
        'id': userId,
      };
}
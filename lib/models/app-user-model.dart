class UserLoginModel {
  final String firstName;
  final String lastName;
  final String email;
  final Auth auth;
  UserLoginModel(this.firstName, this.lastName, this.email,this.auth);

  UserLoginModel.fromJson(Map<String, dynamic> json)
      : firstName = json['user']['firstName'],
        lastName = json['user']['lastName'],
        email = json['user']['email'],
        auth = Auth.fromJson(json['token']);
}

class Auth {
  final String refreshToken;
  final String accessToken;

  Auth(this.refreshToken, this.accessToken);

  Auth.fromJson(Map<String, dynamic> json)
      : accessToken = json['accessToken'],
        refreshToken = json['refreshToken'];
}

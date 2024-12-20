class UserParams {
  String login;
  String password;

  UserParams({required this.login, required this.password});

  factory UserParams.fromJson(Map<String, dynamic> json) => UserParams(
        login: json['login'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password
  };
}

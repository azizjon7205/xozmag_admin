class LoginAdminParams {
  String username;
  String password;

  LoginAdminParams({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}
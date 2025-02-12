class CreateUserParams {
  String name;
  String role;
  String phone;
  String username;
  String password;

  CreateUserParams({
    required this.name,
    required this.role,
    required this.phone,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'role': role,
    'phone': phone,
    'username': username,
    'password': password,
  };
}
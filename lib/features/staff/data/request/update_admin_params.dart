class UpdateAdminParams {
  String name;
  String role;
  String username;

  UpdateAdminParams({
    required this.name,
    required this.role,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'role': role,
    'username': username,
  };
}
class StaffRole {
  String roleName;
  dynamic id;
  Role role;

  StaffRole({
    required this.roleName,
    required this.id,
    required this.role,
  });
}

enum Role {
  admin,
  superAdmin,
  operator,
  courier,
  manager,
}

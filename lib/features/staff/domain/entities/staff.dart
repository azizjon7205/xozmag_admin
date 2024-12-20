import 'package:xozmag_admin/features/staff/domain/entities/staff_role.dart';

class Staff {
  dynamic id;
  String fullName;
  String phone;
  StaffRole role;
  String? avatar;

  Staff({
    this.id,
    required this.fullName,
    required this.phone,
    required this.role,
    this.avatar,
  });
}

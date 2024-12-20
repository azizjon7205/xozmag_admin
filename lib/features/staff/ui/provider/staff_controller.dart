import 'package:flutter/material.dart';

import '../../domain/entities/staff_role.dart';

class StaffController extends ChangeNotifier{
  List<StaffRole> roles = [];

  void loadStaffRoles() async {
    roles = [
      StaffRole(roleName: 'Admin', id: '1', role: Role.admin),
      StaffRole(roleName: 'SuperAdmin', id: '2', role: Role.superAdmin),
      StaffRole(roleName: 'Operator', id: '3', role: Role.operator),
      StaffRole(roleName: 'Courier', id: '4', role: Role.courier),
    ];
    notifyListeners();
  }

  void selectStaffRole(StaffRole item) {}
}
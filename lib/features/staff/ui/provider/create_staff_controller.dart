import 'package:flutter/material.dart';

import '../../domain/entities/staff_role.dart';
import '../../domain/usecase/pick_image_usecase.dart';
import '../models/staff_media_model.dart';

class CreateStaffController extends ChangeNotifier {
  final PickIMageUseCase iMageUseCase = PickIMageUseCase();

  CreateStaffController() {
    fullNameEditingController.addListener(() {
      checkFormsReady();
    });
    phoneNumberEditingController.addListener(() {
      checkFormsReady();
    });
    loginEditingController.addListener(() {
      checkFormsReady();
    });
    passwordEditingController.addListener(() {
      checkFormsReady();
    });
  }

  final TextEditingController fullNameEditingController =
      TextEditingController();
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final TextEditingController loginEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  bool isReadyToSave = false;

  StaffMediaModel? staffImage;
  bool status = true;
  StaffRole? staffRole;
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

  void selectStaffRole(StaffRole role) {
    staffRole = role;
    notifyListeners();
  }

  void deleteImage() {
    staffImage = null;
    notifyListeners();
  }

  void pickImage() async {
    final media = await iMageUseCase.pickImage();
    staffImage = media?.toStaffMediaModel();
    notifyListeners();
  }

  void onStatusChange(bool value) {
    status = value;
    notifyListeners();
  }

  void checkFormsReady() {
    isReadyToSave = fullNameEditingController.text.isNotEmpty &&
        phoneNumberEditingController.text.isNotEmpty &&
        loginEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty &&
        staffRole != null;
    notifyListeners();
  }

  @override
  void dispose() {
    fullNameEditingController.dispose();
    phoneNumberEditingController.dispose();
    loginEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }
}

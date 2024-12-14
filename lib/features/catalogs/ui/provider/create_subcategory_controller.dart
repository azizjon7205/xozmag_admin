import 'package:flutter/material.dart';

class CreateSubcategoryController extends ChangeNotifier {

  final TextEditingController nameUzEditingController = TextEditingController();
  final TextEditingController nameCyrilEditingController = TextEditingController();
  final TextEditingController nameRuEditingController = TextEditingController();
  bool status = true;

  void onStatusChange(bool value) {
    status = value;
    notifyListeners();
  }

}
import 'package:flutter/material.dart';

class MenuItem {
  String? image;
  String label;
  Color? color;
  bool isSelected;

  MenuItem({this.image, this.color, required this.label, this.isSelected = false});

}
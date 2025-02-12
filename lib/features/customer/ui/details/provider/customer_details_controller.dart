import 'package:flutter/material.dart';
import '../../../domain/customer_address.dart';
import '/shared/models/media_model_ui.dart';

class CustomerDetailsController extends ChangeNotifier {

  CustomerDetailsController() {
    loadAddresses();
  }

  final TextEditingController fullNameEditingController =
  TextEditingController();
  final TextEditingController phoneNumberEditingController =
  TextEditingController();

  MediaModelUI? mediaModelUI;

  List<CustomerAddress> addresses = [];
  
  void loadAddresses() {
    addresses.add(CustomerAddress(alias: 'Uy', address: "Samarkand, Ishtikhan, Uzbekistan"));
    addresses.add(CustomerAddress(alias: 'Apartment', address: "Samarkand, Ishtikhan, Uzbekistan"));
    addresses.add(CustomerAddress(alias: 'Work', address: "Tashkent, Ishtikhan, Uzbekistan"));
    notifyListeners();
  }

  void deleteImage() {}

  void pickImage() {}

}
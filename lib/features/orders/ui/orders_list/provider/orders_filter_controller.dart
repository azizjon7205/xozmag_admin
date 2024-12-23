import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/orders/domain/entities/order_status.dart';
import 'package:xozmag_admin/features/orders/domain/entities/payment_type.dart';

class OrderFilterController extends ChangeNotifier {
  get isReadyToSave => false;

  final toDateKey = UniqueKey();
  final fromDateKey = UniqueKey();

  List<OrderStatus> statuses = [];
  Map<dynamic, OrderStatus> formattedStatuses = {};

  List<PaymentType> paymentTypes = [];
  Map<dynamic, PaymentType> formattedPaymentTypes = {};

  String? get statusFieldValue {
    final selectedStatuses =
        formattedStatuses.values.takeWhile((status) => status.checked);
    if (selectedStatuses.isEmpty) {
      return null;
    } else {
      return selectedStatuses.map((status) => status.name).join(' / ');
    }
  }

  String? get priceFieldValue => 'In progress';

  String? get paymentTypeFieldValue {
    final selectedStatuses =
        formattedPaymentTypes.values.takeWhile((type) => type.checked);
    if (selectedStatuses.isEmpty) {
      return null;
    } else {
      return selectedStatuses.map((type) => type.name).join(' / ');
    }
  }

  final TextEditingController fromPriceEditingController =
      TextEditingController();
  final TextEditingController toPriceEditingController =
      TextEditingController();

  DateTime? toDate;
  DateTime? fromDate;

  void loadOrderStatuses() async {
    statuses = [
      OrderStatus(id: '1', name: "Yetkazilgan"),
      OrderStatus(id: '2', name: "Jarayonda"),
      OrderStatus(id: '3', name: "Bekor qilingan"),
    ];

    for (var status in statuses) {
      formattedStatuses[status.id] = status;
    }

    notifyListeners();
  }

  void loadOrderPaymentTypes() async {
    paymentTypes = [
      PaymentType(id: '1', name: "Payme"),
      PaymentType(id: '2', name: "Click"),
      PaymentType(id: '3', name: "Uzum"),
      PaymentType(id: '4', name: "Naqd"),
    ];

    for (var type in paymentTypes) {
      formattedPaymentTypes[type.id] = type;
    }

    notifyListeners();
  }

  void onChangeStatusChecked(dynamic id, bool value) {
    formattedStatuses[id]?.checked = value;
    notifyListeners();
  }

  void onChangePaymentTypeChecked(dynamic id, bool value) {
    formattedPaymentTypes[id]?.checked = value;
    notifyListeners();
  }

  void onToDateChange(DateTime? time) async {
    toDate = time;
    notifyListeners();
  }

  void onFromDateChange(DateTime? time) async {
    fromDate = time;
    notifyListeners();
  }



  @override
  void dispose() {
    fromPriceEditingController.dispose();
    toPriceEditingController.dispose();
    super.dispose();
  }
}

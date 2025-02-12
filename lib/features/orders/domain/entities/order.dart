class Order {

  dynamic id;
  String customerNumber;
  String status;
  String paymentType;
  int deliveryPrice;
  int totalPrice;
  DateTime? dateTime;

  Order({
    required this.id,
    required this.customerNumber,
    required this.status,
    required this.paymentType,
    required this.deliveryPrice,
    required this.totalPrice,
    this.dateTime
  });
}
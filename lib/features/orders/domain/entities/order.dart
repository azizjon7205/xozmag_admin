class Order {

  dynamic id;
  String customerNumber;
  String status;
  String paymentType;
  int deliveryPrice;
  int totalPrice;

  Order({
    required this.id,
    required this.customerNumber,
    required this.status,
    required this.paymentType,
    required this.deliveryPrice,
    required this.totalPrice,
  });
}
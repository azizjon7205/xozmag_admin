class PaymentType {
  dynamic id;
  String name;
  bool checked;

  PaymentType({
    required this.id,
    required this.name,
    this.checked = false,
  });
}

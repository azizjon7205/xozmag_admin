class OrderStatus {
  dynamic id;
  String name;
  bool checked;

  OrderStatus({
    required this.id,
    required this.name,
    this.checked = false,
  });
}

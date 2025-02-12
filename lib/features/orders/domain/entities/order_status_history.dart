class OrderStatusHistory {
  dynamic id;
  String status;
  DateTime date;
  String changedBy;
  String color;

  OrderStatusHistory({
    this.id,
    required this.status,
    required this.date,
    required this.color,
    required this.changedBy,
  });
}

dummyOrderStatusHistory() {
  return OrderStatusHistory(
    status: "To'lov qilindi",
    date: DateTime.now(),
    color: '#3559E9',
    changedBy: "Sheronov Azizjon",
  );
}

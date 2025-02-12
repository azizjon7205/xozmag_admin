class OrderProduct {
  dynamic id;
  String name;
  String attribute;
  int amount;
  String status;
  int price;
  int totalPrice;
  String image;

  OrderProduct({
    this.id,
    required this.name,
    required this.attribute,
    required this.amount,
    required this.status,
    required this.price,
    required this.totalPrice,
    required this.image,
  });
}

dummyOrderProduct() {
  return OrderProduct(
    id: 1,
      name:
          'Hammom oynasi 40x60 sm o\'lchamdagi oq rangli yorug\'likli LED yorug\'lik',
      attribute: 'Qizil',
      amount: 2,
      status: "Yetkazilgan",
      price: 75000,
      totalPrice: 150000,
      image: 'https://picsum.photos/id/1/200/300',
  );
}

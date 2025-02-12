class Payment {
  int productsPrice;
  int productsAmount;
  int deliveryPrice;
  int totalPrice;
  Discount? discount;

  Payment({
    required this.productsPrice,
    required this.productsAmount,
    required this.deliveryPrice,
    required this.totalPrice,
    this.discount,
  });
}

class Discount {
  dynamic id;
  String name;
  String? description;
  int discountPrice;

  Discount({
    this.id,
    required this.name,
    this.description,
    required this.discountPrice,
  });
}

dummyOrderPayment() {
  return Payment(
      productsPrice: 2385000,
      productsAmount: 9,
      deliveryPrice: 15000,
      totalPrice: 2376000,
      discount: Discount(
        name: "Xozmag10",
        description: null,
        discountPrice: 24000,
      ));
}

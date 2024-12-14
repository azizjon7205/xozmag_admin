class Product {
  dynamic id;
  String image;
  String name;
  int amount;
  int optionsCount;
  double rating;

  Product({
    this.id,
    required this.image,
    required this.name,
    required this.amount,
    this.optionsCount = 1,
    this.rating = 5.0,
  });
}

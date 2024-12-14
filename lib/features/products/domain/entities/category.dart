class ProductCategory {
  dynamic id;
  String name;
  List<ProductCategory> subCategories;

  ProductCategory({
    required this.id,
    required this.name,
    this.subCategories = const [],
  });
}

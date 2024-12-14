import 'product_attribute_entity.dart';

class ProductDetails {
  dynamic id;
  String productId;
  String categoryId;
  String? subCategoryId;
  String nameUz;
  String nameRu;
  String nameCyril;
  String shortInfoUz;
  String shortInfoRu;
  String shortInfoCyril;
  String descriptionUz;
  String descriptionRu;
  String descriptionCyril;
  List<ProductAttribute>? productAttributes;

  ProductDetails(
      {required this.id,
      required this.productId,
      required this.categoryId,
      this.subCategoryId,
      required this.nameUz,
      required this.nameRu,
      required this.nameCyril,
      required this.shortInfoUz,
      required this.shortInfoRu,
      required this.shortInfoCyril,
      required this.descriptionUz,
      required this.descriptionRu,
      required this.descriptionCyril,
      this.productAttributes});

  ProductDetails copyWith(
      {dynamic id,
      String? productId,
      String? categoryId,
      String? subCategoryId,
      String? nameUz,
      String? nameRu,
      String? nameCyril,
      String? shortInfoUz,
      String? shortInfoRu,
      String? shortInfoCyril,
      String? descriptionUz,
      String? descriptionRu,
      String? descriptionCyril,
      List<ProductAttribute>? productAttributes}) {
    return ProductDetails(
      id: id,
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      nameUz: nameUz ?? this.nameUz,
      nameRu: nameRu ?? this.nameRu,
      nameCyril: nameCyril ?? this.nameCyril,
      shortInfoUz: shortInfoUz ?? this.shortInfoUz,
      shortInfoRu: shortInfoRu ?? this.shortInfoRu,
      shortInfoCyril: shortInfoCyril ?? this.shortInfoCyril,
      descriptionUz: descriptionUz ?? this.descriptionUz,
      descriptionRu: descriptionRu ?? this.descriptionRu,
      descriptionCyril: descriptionCyril ?? this.descriptionCyril,
    );
  }
}

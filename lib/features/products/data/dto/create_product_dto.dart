class CreateProductDto {
  dynamic id;
  String? productId;
  String? categoryId;
  String? subCategoryId;
  DateTime? createdAt;
  dynamic createdBy;
  DateTime? updatedAt;
  dynamic updatedBy;
  String? nameKr;
  String? nameLt;
  String? nameRu;
  String? shortInfoKr;
  String? shortInfoLt;
  String? shortInfoRu;
  String? descriptionKr;
  String? descriptionLt;
  String? descriptionRu;
  String? status;
  List<ProductDetail>? productDetails;
  List<FileDetail>? files;

  CreateProductDto({
    this.id,
    this.productId,
    this.categoryId,
    this.subCategoryId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.nameKr,
    this.nameLt,
    this.nameRu,
    this.shortInfoKr,
    this.shortInfoLt,
    this.shortInfoRu,
    this.descriptionKr,
    this.descriptionLt,
    this.descriptionRu,
    this.status,
    this.productDetails,
    this.files,
  });

  factory CreateProductDto.fromJson(Map<String, dynamic> json) => CreateProductDto(
    id: json['id'],
    productId: json['product_id'],
    categoryId: json['category_id'],
    subCategoryId: json['sub_category_id'],
    createdAt: DateTime.tryParse(json['created_at']),
    createdBy: json['created_by'],
    updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    updatedBy: json['updated_by'],
    nameKr: json['name_kr'],
    nameLt: json['name_lt'],
    nameRu: json['name_ru'],
    shortInfoKr: json['short_info_kr'],
    shortInfoLt: json['short_info_lt'],
    shortInfoRu: json['short_info_ru'],
    descriptionKr: json['description_kr'],
    descriptionLt: json['description_lt'],
    descriptionRu: json['description_ru'],
    status: json['status'],
    productDetails: (json['product_details'] as List?)
        ?.map((e) => ProductDetail.fromJson(e))
        .toList(),
    files: (json['files'] as List?)?.map((e) => FileDetail.fromJson(e)).toList(),
  );
}

class ProductDetail {
  dynamic id;
  String? productId;
  int? color;
  double? weight;
  int? capacity;
  int? twoDimensionalHeight;
  int? twoDimensionalWidth;
  int? threeDimensionalHeight;
  int? threeDimensionalWidth;
  int? threeDimensionalThick;
  int? amount;
  double? price;
  double? discountPrice;
  double? discountPercent;
  DateTime? createdAt;
  dynamic createdBy;
  DateTime? updatedAt;
  dynamic updatedBy;

  ProductDetail({
    this.id,
    this.productId,
    this.color,
    this.weight,
    this.capacity,
    this.twoDimensionalHeight,
    this.twoDimensionalWidth,
    this.threeDimensionalHeight,
    this.threeDimensionalWidth,
    this.threeDimensionalThick,
    this.amount,
    this.price,
    this.discountPrice,
    this.discountPercent,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json['id'],
    productId: json['product_id'],
    color: json['color'],
    weight: (json['weight'] as num?)?.toDouble(),
    capacity: json['capacity'],
    twoDimensionalHeight: json['two_dimensional_height'],
    twoDimensionalWidth: json['two_dimensional_width'],
    threeDimensionalHeight: json['three_dimensional_height'],
    threeDimensionalWidth: json['three_dimensional_width'],
    threeDimensionalThick: json['three_dimensional_thick'],
    amount: json['amount'],
    price: (json['price'] as num?)?.toDouble(),
    discountPrice: (json['discount_price'] as num?)?.toDouble(),
    discountPercent: (json['discount_percent'] as num?)?.toDouble(),
    createdAt: DateTime.tryParse(json['created_at']),
    createdBy: json['created_by'],
    updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    updatedBy: json['updated_by'],
  );
}

class FileDetail {
  dynamic id;
  String? fileId;
  String? name;
  String? filePath;
  int? size;
  String? extension;
  DateTime? createdAt;
  dynamic createdBy;
  DateTime? updatedAt;
  dynamic updatedBy;
  bool? isMain;
  String? attachId;

  FileDetail({
    this.id,
    this.fileId,
    this.name,
    this.filePath,
    this.size,
    this.extension,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.isMain,
    this.attachId,
  });

  factory FileDetail.fromJson(Map<String, dynamic> json) => FileDetail(
    id: json['id'],
    fileId: json['file_id'],
    name: json['name'],
    filePath: json['file_path'],
    size: json['size'],
    extension: json['extension'],
    createdAt: DateTime.tryParse(json['created_at']),
    createdBy: json['created_by'],
    updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    updatedBy: json['updated_by'],
    isMain: json['is_main'],
    attachId: json['attach_id'],
  );
}

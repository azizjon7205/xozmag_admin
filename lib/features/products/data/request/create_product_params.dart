class CreateProductParams {
  final String categoryId;
  final String subCategoryId;
  final String nameKr;
  final String nameLt;
  final String nameRu;
  final String shortInfoKr;
  final String shortInfoLt;
  final String shortInfoRu;
  final String descriptionKr;
  final String descriptionLt;
  final String descriptionRu;
  final String status;
  final List<ProductDetail> productDetails;
  final List<FileDetail> files;

  CreateProductParams({
    required this.categoryId,
    required this.subCategoryId,
    required this.nameKr,
    required this.nameLt,
    required this.nameRu,
    required this.shortInfoKr,
    required this.shortInfoLt,
    required this.shortInfoRu,
    required this.descriptionKr,
    required this.descriptionLt,
    required this.descriptionRu,
    required this.status,
    required this.productDetails,
    required this.files,
  });

  factory CreateProductParams.fromJson(Map<String, dynamic> json) {
    return CreateProductParams(
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
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
      productDetails: (json['product_details'] as List)
          .map((detail) => ProductDetail.fromJson(detail))
          .toList(),
      files: (json['files'] as List)
          .map((file) => FileDetail.fromJson(file))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'name_kr': nameKr,
      'name_lt': nameLt,
      'name_ru': nameRu,
      'short_info_kr': shortInfoKr,
      'short_info_lt': shortInfoLt,
      'short_info_ru': shortInfoRu,
      'description_kr': descriptionKr,
      'description_lt': descriptionLt,
      'description_ru': descriptionRu,
      'status': status,
      'product_details': productDetails.map((detail) => detail.toJson()).toList(),
      'files': files.map((file) => file.toJson()).toList(),
    };
  }
}

class ProductDetail {
  final int color;
  final double weight;
  final int capacity;
  final int twoDimensionalHeight;
  final int twoDimensionalWidth;
  final int threeDimensionalHeight;
  final int threeDimensionalWidth;
  final int threeDimensionalThick;
  final int amount;
  final int price;
  final double discountPrice;
  final double discountPercent;

  ProductDetail({
    required this.color,
    required this.weight,
    required this.capacity,
    required this.twoDimensionalHeight,
    required this.twoDimensionalWidth,
    required this.threeDimensionalHeight,
    required this.threeDimensionalWidth,
    required this.threeDimensionalThick,
    required this.amount,
    required this.price,
    required this.discountPrice,
    required this.discountPercent,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      color: json['color'],
      weight: json['weight'],
      capacity: json['capacity'],
      twoDimensionalHeight: json['two_dimensional_height'],
      twoDimensionalWidth: json['two_dimensional_width'],
      threeDimensionalHeight: json['three_dimensional_height'],
      threeDimensionalWidth: json['three_dimensional_width'],
      threeDimensionalThick: json['three_dimensional_thick'],
      amount: json['amount'],
      price: json['price'],
      discountPrice: json['discount_price'],
      discountPercent: json['discount_percent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'weight': weight,
      'capacity': capacity,
      'two_dimensional_height': twoDimensionalHeight,
      'two_dimensional_width': twoDimensionalWidth,
      'three_dimensional_height': threeDimensionalHeight,
      'three_dimensional_width': threeDimensionalWidth,
      'three_dimensional_thick': threeDimensionalThick,
      'amount': amount,
      'price': price,
      'discount_price': discountPrice,
      'discount_percent': discountPercent,
    };
  }
}

class FileDetail {
  final String fileId;
  final String name;
  final String filePath;
  final int size;
  final String extension;
  final bool isMain;

  FileDetail({
    required this.fileId,
    required this.name,
    required this.filePath,
    required this.size,
    required this.extension,
    required this.isMain,
  });

  factory FileDetail.fromJson(Map<String, dynamic> json) {
    return FileDetail(
      fileId: json['file_id'],
      name: json['name'],
      filePath: json['file_path'],
      size: json['size'],
      extension: json['extension'],
      isMain: json['is_main'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file_id': fileId,
      'name': name,
      'file_path': filePath,
      'size': size,
      'extension': extension,
      'is_main': isMain,
    };
  }
}
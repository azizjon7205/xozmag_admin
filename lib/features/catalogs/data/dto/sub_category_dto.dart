class SubCategoryDto {
  final dynamic id;
  final String name;
  final String? photo;
  final dynamic categoryId;

  SubCategoryDto({
    required this.id,
    required this.name,
    this.photo,
    required this.categoryId,
  });

  factory SubCategoryDto.fromJson(Map<String, dynamic> json) {
    return SubCategoryDto(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      categoryId: json['categoryId'],
    );
  }
}

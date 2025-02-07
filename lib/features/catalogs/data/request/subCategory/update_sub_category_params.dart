class UpdateSubCategoryParams {
  String nameLt;
  String nameKr;
  String nameRu;
  String? photo;
  dynamic categoryId;

  UpdateSubCategoryParams({required this.nameLt,
    required this.nameKr,
    required this.nameRu,
    required this.categoryId,
    this.photo});

  Map<String, dynamic> toJson() =>
      {
        "name_lt": nameLt,
        "name_kr": nameKr,
        "name_ru": nameRu,
        "photo": photo,
        "categoryId": categoryId
      };
}
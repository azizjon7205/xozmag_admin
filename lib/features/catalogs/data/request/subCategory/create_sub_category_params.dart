class CreateSubCategoryParams {
  String nameLt;
  String nameKr;
  String nameRu;
  dynamic categoryId;

  CreateSubCategoryParams(
      {required this.nameLt,
      required this.nameKr,
      required this.nameRu,
      required this.categoryId});

  Map<String, dynamic> toJson() => {
        "name_lt": nameLt,
        "name_kr": nameKr,
        "name_ru": nameRu,
        "categoryId": categoryId
      };
}

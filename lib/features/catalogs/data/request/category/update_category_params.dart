class UpdateCategoryParams {
  String nameLt;
  String nameKr;
  String nameRu;
  String? photo;

  UpdateCategoryParams(
      {required this.nameLt,
      required this.nameKr,
      required this.nameRu,
      this.photo});

  Map<String, dynamic> toJson() => {
        'name_lt': nameLt,
        'name_kr': nameKr,
        'name_ru': nameRu,
        'photo': photo,
      };
}

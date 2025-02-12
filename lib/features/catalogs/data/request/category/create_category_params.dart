class CreateCategoryParams {
  String name;
  String photo;

  CreateCategoryParams({required this.name, required this.photo});

  Map<String, dynamic> toJson() => {'name': name, 'photo': photo};
}

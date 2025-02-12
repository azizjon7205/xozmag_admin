class CategoryDTO {
  dynamic id;
  String name;
  String? photo;

  CategoryDTO({required this.id, required this.name, this.photo});

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      CategoryDTO(id: json['id'], name: json['name'], photo: json['photo']);
}

class Category {
  String? image;
  String name;
  String nameUz;
  String nameCyril;
  String nameRu;
  int count;
  bool isSub;

  Category(
      {this.name = '',
      this.nameUz = '',
      this.nameCyril = '',
      this.nameRu = '',
      this.image,
      this.count = 0,
      this.isSub = false});
}

class CatalogMedia {
  dynamic id;
  String name;
  String? imageUrl;
  String extension;
  int size;
  String? filePath;

  CatalogMedia({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.extension,
    required this.size,
    this.filePath
  });
}

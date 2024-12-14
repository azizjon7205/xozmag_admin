class ProductMediaFile {
  dynamic id;
  String name;
  String extension;
  bool isMain;
  bool isImage;
  String? url;
  int size;
  String? filePath;

  ProductMediaFile({
    required this.id,
    required this.name,
    this.extension = "",
    this.isMain = false,
    this.isImage = true,
    this.url,
    this.size = 0,
    this.filePath
  });

  ProductMediaFile copyWith({
    dynamic id,
    String? name,
    String? extension,
    String? url,
    bool? isMain,
    bool? isImage,
    int? size,
    String? filePath
  }) {
    return ProductMediaFile(
      id: id ?? this.id,
      name: name ?? this.name,
      extension: extension ?? this.extension,
      url: url ?? this.url,
      isMain: isMain ?? this.isMain,
      isImage: isImage ?? this.isImage,
      size: size ?? this.size,
      filePath: filePath ?? this.filePath
    );
  }


  @override
  String toString() {
    // TODO: implement toString
    return 'ProductMediaFile(id: $id, name: $name, extension: $extension,';
  }
}

import 'package:flutter/material.dart';

class MediaFileViewModel {
  dynamic id;
  final String name;
  final String extension;
  final int sizeInBytes;
  final bool isImage;
  final ImageProvider? imageProvider;
  final String? filePath;
  final bool isMain;

  MediaFileViewModel({
    this.id,
    required this.name,
    required this.extension,
    required this.sizeInBytes,
    required this.imageProvider,
    this.isImage = true,
    this.isMain = false,
    this.filePath,
  });

  MediaFileViewModel copyWith({
    dynamic id,
    String? name,
    String? extension,
    int? size,
    bool? isImage,
    String? filePath,
    bool? isMain,
  }) {
    return MediaFileViewModel(
      name: name ?? this.name,
      extension: extension ?? this.extension,
      sizeInBytes: size ?? sizeInBytes,
      imageProvider: imageProvider,
      isImage: isImage ?? this.isImage,
      isMain: isMain ?? this.isMain
    );
  }
}

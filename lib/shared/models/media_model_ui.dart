import 'package:flutter/material.dart';

class MediaModelUI {
  dynamic id;
  final String name;
  final String extension;
  final int sizeInBytes;
  final ImageProvider? imageProvider;
  final String? filePath;

  MediaModelUI({
    this.id,
    required this.name,
    required this.extension,
    required this.sizeInBytes,
    this.imageProvider,
    this.filePath,
  });
}

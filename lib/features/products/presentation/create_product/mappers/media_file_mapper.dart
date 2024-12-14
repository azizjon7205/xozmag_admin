import 'dart:io';

import 'package:flutter/material.dart';

import '../../../domain/entities/product_media_file.dart';
import '../models/product_media_file.dart';

class MediaFileMapper {
  static MediaFileViewModel toViewModel(ProductMediaFile mediaFile) {
    ImageProvider imageProvider;

    if (!mediaFile.isImage) {
      return MediaFileViewModel(
        id: mediaFile.id,
        name: mediaFile.name,
        extension: mediaFile.extension,
        imageProvider: null,
        sizeInBytes: mediaFile.size,
        filePath: mediaFile.filePath,
        isImage: mediaFile.isImage,
      );
    }

    if (mediaFile.filePath != null) {
      // Use FileImage for local files
      imageProvider = FileImage(File(mediaFile.filePath!));
    } else if (mediaFile.url != null) {
      // Use NetworkImage for remote URLs
      imageProvider = NetworkImage(mediaFile.url!); // Assuming `name` stores the URL
    } else {
      throw Exception("Invalid image source: ${mediaFile.name}");
    }

    return MediaFileViewModel(
      id: mediaFile.id,
      name: mediaFile.name,
      extension: mediaFile.extension,
      sizeInBytes: mediaFile.size,
      imageProvider: imageProvider,
      filePath: mediaFile.filePath,
      isImage: mediaFile.isImage,
    );
  }

  static ProductMediaFile toMediaFile(MediaFileViewModel mediaFile) {
    return ProductMediaFile(
      id: mediaFile.id,
      name: mediaFile.name,
      extension: mediaFile.extension,
      size: mediaFile.sizeInBytes,
      filePath: mediaFile.filePath,
      isImage: mediaFile.isImage,
    );
  }
}
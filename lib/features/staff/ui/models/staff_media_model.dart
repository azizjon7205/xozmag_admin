import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/staff/domain/entities/staff_media.dart';

class StaffMediaModel {
  dynamic id;
  final String name;
  final String extension;
  final int sizeInBytes;
  final ImageProvider? imageProvider;
  final String? filePath;

  StaffMediaModel(
      {this.id,
      required this.name,
      required this.extension,
      required this.sizeInBytes,
      this.imageProvider,
      this.filePath,});


}

extension MediaFileExtension on StaffMedia {
  StaffMediaModel toStaffMediaModel() {
    ImageProvider imageProvider;

    if (filePath != null) {
      // Use FileImage for local files
      imageProvider = FileImage(File(filePath!));
    } else if (imageUrl != null) {
      // Use NetworkImage for remote URLs
      imageProvider = NetworkImage(imageUrl!); // Assuming `name` stores the URL
    } else {
      throw Exception("Invalid image source: ${name}");
    }

    return StaffMediaModel(
      name: name,
      extension: extension,
      sizeInBytes: size,
      imageProvider: imageProvider,
      filePath: filePath,
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/staff/domain/entities/staff_media.dart';

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


import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:xozmag_admin/features/products/domain/entities/product_media_file.dart';

class PickMediaUseCase {
  final ImagePicker _imagePicker = ImagePicker();
  final imageExtensions = ["jpg", "jpeg", "png"];
  final videoExt = "mp4";
  final uuid = const Uuid();

  Future<List<ProductMediaFile>?> pickMedia(
      {int maxInBytes = 7 * 1024 * 1024, int maxLimit = 4}) async {
    List<XFile> files;
    if (maxLimit >= 2) {
      files = await _imagePicker.pickMultipleMedia(limit: maxLimit);
    } else if (maxLimit > 0) {
      final file = await _imagePicker.pickMedia();
      if (file == null) return null;
      files = [file];
    } else {
      return null;
    }

    if (files.isEmpty) return null;

    final localMedia = files
        .takeWhile((file) => File(file.path).lengthSync() <= maxInBytes)
        .map((item) {
          final file = File(item.path);
          final size = file.lengthSync();
          final extension = item.name.split('.').last;
          bool isImage = true;
          if (extension == videoExt) isImage = false;

          return ProductMediaFile(
              id: uuid.v4(),
              name: 'Media',
              size: size,
              isImage: isImage,
              extension: extension,
              filePath: item.path);
        })
        .takeWhile((file) => file.size <= maxInBytes)
        .toList();
    return localMedia;
  }

  Future<ProductMediaFile?> updateMedia(ProductMediaFile media) async {
    XFile? localFile;
    if (media.isImage) {
      localFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
    } else {
      localFile = await _imagePicker.pickVideo(
        source: ImageSource.gallery,
      );
    }
    if (localFile == null) return null;
    final file = File(localFile.path);
    final size = file.lengthSync();
    final extension = localFile.name.split('.').last;
    bool isImage = true;
    if (extension == videoExt) isImage = false;

    return media.copyWith(
        size: size,
        isImage: isImage,
        extension: extension,
        filePath: localFile.path,
    );
  }
}

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:xozmag_admin/features/catalogs/domain/entities/catalog_media.dart';

class PickIMageUseCase {
  final ImagePicker _imagePicker = ImagePicker();
  final imageExtensions = ["jpg", "jpeg", "png"];
  final uuid = const Uuid();

  Future<CatalogMedia?> pickImage({int maxInBytes = 5 * 1024 * 1024, }) async {
    final result = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (result == null) return null;
    final file = File(result.path);
    if (file.lengthSync() <= maxInBytes) {
      final size = file.lengthSync();
      final extension = result.name.split('.').last;

      return CatalogMedia(
          id: uuid.v4(),
          name: result.name,
          extension: extension,
          size: size,
        filePath: result.path
      );
    }
    return null;
  }

}

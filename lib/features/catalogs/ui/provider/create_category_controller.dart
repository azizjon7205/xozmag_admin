import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/catalogs/domain/usecase/pick_image_usecase.dart';
import 'package:xozmag_admin/features/catalogs/ui/models/media_file_model.dart';

class CreateCategoryController extends ChangeNotifier {
  final PickIMageUseCase _pickIMageUseCase = PickIMageUseCase();

  final TextEditingController nameUzEditingController = TextEditingController();
  final TextEditingController nameCyrilEditingController = TextEditingController();
  final TextEditingController nameRuEditingController = TextEditingController();
  bool status = true;
  MediaFileModel? categoryImage;

  void onStatusChange(bool value) {
    status = value;
    notifyListeners();
  }

  void pickImage() async {
    final media = await _pickIMageUseCase.pickImage();
    categoryImage = media?.toMediaFileModel();
    notifyListeners();
  }

  void deleteImage() {
    categoryImage = null;
    notifyListeners();
  }


}
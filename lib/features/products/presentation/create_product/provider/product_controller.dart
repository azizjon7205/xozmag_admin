import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/products/presentation/create_product/mappers/media_file_mapper.dart';

import '../../../application/pick_media_usecase.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/product_attribute_entity.dart';
import '../models/product_media_file.dart';

class ProductController extends ChangeNotifier {
  PickMediaUseCase pickMediaUseCase = PickMediaUseCase();

  List<ProductAttribute> options = [];

  TextEditingController nameUzEditingController = TextEditingController();
  TextEditingController nameRuEditingController = TextEditingController();
  TextEditingController nameCrEditingController = TextEditingController();
  TextEditingController shortInfoUzEditingController = TextEditingController();
  TextEditingController shortInfoRuEditingController = TextEditingController();
  TextEditingController shortInfoCrEditingController = TextEditingController();

  List<ProductCategory> categories = [];
  ProductCategory? category;
  ProductCategory? subCategory;

  MediaFileViewModel? mainMedia;
  List<MediaFileViewModel> media = [];

  void loadFromGallery() async {
    final maxLimit = 4 - media.length;
    final files =
        await pickMediaUseCase.pickMedia(maxLimit: maxLimit < 0 ? 0 : maxLimit);
    media.addAll(
        files?.map((item) => MediaFileMapper.toViewModel(item)).toList() ?? []);
    mainMedia ??= media.where((e) => e.isImage).firstOrNull;
    notifyListeners();
  }

  void updateMedia(dynamic id) async {
    final file = await pickMediaUseCase.updateMedia(
        MediaFileMapper.toMediaFile(media.firstWhere((e) => e.id == id)));
    if (file != null) {
      media[media.indexWhere((e) => e.id == id)] =
          MediaFileMapper.toViewModel(file);
      notifyListeners();
    }
  }

  void deleteMedia(dynamic id) async {
    media.removeWhere((e) => e.id == id);
    if (media.isEmpty) {
      mainMedia = null;
    }
    notifyListeners();
  }

  void setMain(MediaFileViewModel file) {
    mainMedia = file;
    notifyListeners();
  }

  void loadCategories() async {
    categories.add(ProductCategory(id: '1', name: "Asbob-uskunalar"));
    categories
        .add(ProductCategory(id: '2', name: "Qurilish Mollari", subCategories: [
      ProductCategory(id: '21', name: "Santexnika"),
      ProductCategory(id: '22', name: "Elektronika")
    ]));
    categories.add(ProductCategory(id: '3', name: "Santexnika"));
    categories.add(ProductCategory(id: '4', name: "Elektronika"));
    categories.add(ProductCategory(id: '5', name: "Eshik va derazalar"));
    categories.add(ProductCategory(id: '6', name: "Pol qoplamalari"));
    notifyListeners();
  }

  void selectCategory(ProductCategory category) {
    this.category = category;
    notifyListeners();
  }

  void selectSubcategory(ProductCategory category) {
    subCategory = category;
    notifyListeners();
  }

  void addProductAttribute(ProductAttribute product) async {
    options.add(product);
    notifyListeners();
  }

  @override
  void dispose() {
    nameUzEditingController.dispose();
    nameRuEditingController.dispose();
    nameCrEditingController.dispose();
    shortInfoUzEditingController.dispose();
    shortInfoRuEditingController.dispose();
    shortInfoCrEditingController.dispose();

    super.dispose();
  }
}

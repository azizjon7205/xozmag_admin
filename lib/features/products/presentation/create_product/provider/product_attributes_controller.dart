import 'package:flutter/cupertino.dart';

import '/core/styles/colors/palette_tokens.dart';
import '../../../domain/entities/product_attribute_entity.dart';
import '../../../domain/entities/product_color.dart';

class ProductAttributesController extends ChangeNotifier {
  bool status = true;
  ProductColor? color;
  List<ProductColor> colors = [];

  TextEditingController weightEditingController = TextEditingController();

  TextEditingController capacityEditingController = TextEditingController();
  TextEditingController twoDimensionHeightController = TextEditingController();
  TextEditingController twoDimensionWidthController = TextEditingController();
  TextEditingController threeDimensionHeightController =
      TextEditingController();
  TextEditingController threeDimensionWidthController = TextEditingController();
  TextEditingController threeDimensionThickController = TextEditingController();
  TextEditingController amountEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController discountPriceEditingController =
      TextEditingController();
  TextEditingController discountPercentEditingController =
      TextEditingController();

  bool isFormsReady = false;

  ProductAttributesController() {
    amountEditingController.addListener(() {
      checkFormsReady();
    });
    priceEditingController.addListener(() {
      checkFormsReady();
    });

    twoDimensionWidthController.addListener(() {
      checkFormsReady();
    });
    twoDimensionHeightController.addListener(() {
      checkFormsReady();
    });
  }

  void toggleStatus(bool value) {
    status = value;
    notifyListeners();
  }

  void selectColor(ProductColor? color) {
    this.color = color;
    notifyListeners();
  }

  void loadProductColors() async {
    colors = [
      ProductColor(id: 1, name: 'Ko\'k', color: PaletteTokens.blue500),
      ProductColor(id: 2, name: 'Qizil', color: PaletteTokens.red500),
      ProductColor(id: 3, name: 'Yashil', color: PaletteTokens.green500),
      ProductColor(id: 4, name: 'Kulrang', color: PaletteTokens.neutral500),
      ProductColor(id: 5, name: 'To\'q sariq', color: PaletteTokens.orange500),
      ProductColor(id: 6, name: 'Sariq', color: PaletteTokens.yellow500),
    ];
    notifyListeners();
  }

  ProductAttribute addProductAttribute() {
    final product = ProductAttribute(
      color: color,
      status: status,
      weight: int.tryParse(weightEditingController.text),
      capacity: int.tryParse(capacityEditingController.text),
      twoDimensionalHeight: int.tryParse(twoDimensionHeightController.text),
      twoDimensionalWidth: int.tryParse(twoDimensionWidthController.text),
      threeDimensionalHeight: int.tryParse(threeDimensionHeightController.text),
      threeDimensionalWidth: int.tryParse(threeDimensionWidthController.text),
      threeDimensionalThick: int.tryParse(threeDimensionThickController.text),
      amount: int.tryParse(amountEditingController.text) ?? 0,
      price: int.tryParse(priceEditingController.text) ?? 0,
      discountPrice: int.tryParse(discountPriceEditingController.text),
      discountPercent: int.tryParse(discountPercentEditingController.text),
    );

    return product;
  }

  void checkFormsReady() {
    final twoDimensionsFilled = twoDimensionHeightController.text.isNotEmpty &&
        twoDimensionWidthController.text.isNotEmpty;
    final twoDimensionsEmpty = twoDimensionHeightController.text.isEmpty &&
        twoDimensionWidthController.text.isEmpty;

    final threeDimensionsFilled =
        threeDimensionHeightController.text.isNotEmpty &&
            threeDimensionWidthController.text.isNotEmpty &&
            threeDimensionThickController.text.isNotEmpty;
    final threeDimensionsEmpty = threeDimensionHeightController.text.isEmpty &&
        threeDimensionWidthController.text.isEmpty &&
        threeDimensionThickController.text.isEmpty;

    isFormsReady = amountEditingController.text.isNotEmpty &&
        priceEditingController.text.isNotEmpty &&
        (twoDimensionsFilled || twoDimensionsEmpty) &&
        (threeDimensionsFilled || threeDimensionsEmpty);
    notifyListeners();
  }

  @override
  void dispose() {
    weightEditingController.dispose();
    capacityEditingController.dispose();
    twoDimensionHeightController.dispose();
    twoDimensionWidthController.dispose();
    threeDimensionHeightController.dispose();
    threeDimensionWidthController.dispose();
    threeDimensionThickController.dispose();
    amountEditingController.dispose();
    priceEditingController.dispose();
    discountPercentEditingController.dispose();
    discountPriceEditingController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

import 'slot_product_attributes.dart';
import 'slot_product_details.dart';
import '/shared/widgets/sizes.dart';

import 'slot_product_media.dart';

class ProductFormLayout extends StatelessWidget {
  const ProductFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductMediaSlot(),
          const Height(16.0),
          ProductDetailsSlot(),
          const Height(16.0),
          const ProductAttributesSlot()
        ],
      ),
    );
  }
}

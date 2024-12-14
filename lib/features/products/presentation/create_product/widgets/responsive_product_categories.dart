import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/shared/widgets/sizes.dart';
import '../provider/product_controller.dart';
import 'item_product_category.dart';

class ResponsiveProductCategories extends StatelessWidget {
  const ResponsiveProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, controller, child) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              children: [
                Expanded(
                  child: ItemProductCategory(
                    categories: controller.categories,
                    category: controller.category,
                    onCategorySelected: controller.selectCategory,
                  ),
                ),
                const Width(24),
                Expanded(
                  child: ItemProductCategory(
                    categories: controller.category?.subCategories ?? [],
                    category: controller.subCategory,
                    isSub: true,
                    onCategorySelected: controller.selectSubcategory,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                ItemProductCategory(
                  categories: controller.categories,
                  category: controller.category,
                  onCategorySelected: controller.selectCategory,
                ),
                const Height(24),
                ItemProductCategory(
                  categories: controller.category?.subCategories ?? [],
                  category: controller.subCategory,
                  isSub: true,
                  onCategorySelected: controller.selectSubcategory,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

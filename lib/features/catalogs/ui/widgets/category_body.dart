import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/catalogs/ui/provider/create_category_controller.dart';

import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';
import 'category_attributes_slot.dart';
import 'category_image_slot.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CategoryImageSlot(),
          const Height(12),
          Divider(
            height: 1,
            color: colors(context).strokeSoft,
          ),
          const Height(12),
          Consumer<CreateCategoryController>(
            builder: (context, controller, child) => CategoryAttributesSlot(
              nameUzEditingController: controller.nameUzEditingController,
              nameCyrilEditingController: controller.nameCyrilEditingController,
              nameRuEditingController: controller.nameRuEditingController,
              status: controller.status,
              onStatusChange: controller.onStatusChange,
            ),
          )
        ],
      ),
    );
  }
}

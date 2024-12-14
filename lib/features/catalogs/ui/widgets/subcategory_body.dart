import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/create_subcategory_controller.dart';
import '/shared/widgets/sizes.dart';
import 'category_attributes_slot.dart';
import 'subcategory_main_slot.dart';

class SubcategoryBody extends StatelessWidget {
  const SubcategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SubcategoryMainSlot(),
          const Height(12),
          Consumer<CreateSubcategoryController>(
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

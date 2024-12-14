import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../provider/product_controller.dart';
import 'header_widget_slots.dart';
import 'item_product_description.dart';
import 'responsive_product_categories.dart';

class ProductDetailsSlot extends StatelessWidget {
  const ProductDetailsSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, controller, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors(context).strokeSoft),
        ),
        child: Column(
          children: [
            HeaderWidgetSlots(
              label: 'product.details.header'.tr(),
              prefixSvgPath: 'assets/icons/ic_file_text.svg',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppTextField(
                    controller: controller.nameUzEditingController,
                    label: 'base.name'.tr(),
                    isRequired: true,
                    subLabel: 'language.uz_label'.tr(),
                    hint: '...',
                  ),
                  const Height(24),
                  AppTextField(
                    controller: controller.nameCrEditingController,
                    label: 'base.name'.tr(),
                    isRequired: true,
                    subLabel: 'language.cyril_label'.tr(),
                    hint: '...',
                  ),
                  const Height(24),
                  AppTextField(
                    controller: controller.nameRuEditingController,
                    label: 'base.name'.tr(),
                    isRequired: true,
                    subLabel: 'language.ru_label'.tr(),
                    hint: '...',
                  ),
                  const Height(24),
                  const ResponsiveProductCategories(),
                  const Height(24),
                  AppTextField(
                    controller: controller.shortInfoUzEditingController,
                    label: 'product.details.short_info'.tr(),
                    isRequired: true,
                    subLabel: 'language.uz_label'.tr(),
                    hint: 'product.details.short_info_hint_uz'.tr(),
                    helperText: 'product.details.short_info_helper'.tr(),
                    maxLines: 3,
                  ),
                  const Height(24),
                  AppTextField(
                    controller: controller.shortInfoCrEditingController,
                    label: 'product.details.short_info'.tr(),
                    isRequired: true,
                    subLabel: 'language.cyril_label'.tr(),
                    hint: 'product.details.short_info_hint_cyril'.tr(),
                    helperText: 'product.details.short_info_helper'.tr(),
                    maxLines: 3,
                  ),
                  const Height(24),
                  AppTextField(
                    controller: controller.shortInfoRuEditingController,
                    label: 'product.details.short_info'.tr(),
                    isRequired: true,
                    subLabel: 'language.ru_label'.tr(),
                    hint: 'product.details.short_info_hint_ru'.tr(),
                    helperText: 'product.details.short_info_helper'.tr(),
                    maxLines: 3,
                  ),
                  const Height(24),
                  ItemProductDescription(
                    label: 'product.description'.tr(),
                    subLabel: 'language.uz_label'.tr(),
                    onSetup: () {
                      navController.push(const ProductDescriptionEditorRoute());
                    },
                  ),
                  const Height(24),
                  ItemProductDescription(
                    label: 'product.description'.tr(),
                    subLabel: 'language.cyril_label'.tr(),
                    onSetup: () {
                      navController.push(const ProductDescriptionEditorRoute());
                    },
                  ),
                  const Height(24),
                  ItemProductDescription(
                    label: 'product.description'.tr(),
                    subLabel: 'language.ru_label'.tr(),
                    onSetup: () {
                      navController.push(const ProductDescriptionEditorRoute());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/product_attribute_entity.dart';
import '../provider/product_controller.dart';
import 'content_create_option.dart';
import 'header_widget_slots.dart';
import 'item_product_attribute.dart';

class ProductAttributesSlot extends StatelessWidget {
  const ProductAttributesSlot({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductController>();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors(context).strokeSoft)),
      child: Column(
        children: [
          HeaderWidgetSlots(
            label: 'product.attributes.header'.tr(),
            prefixSvgPath: 'assets/icons/ic_apps_line.svg',
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppOutlinedButton(
                  prefix: SvgPicture.asset(
                    'assets/icons/ic_sort_desc.svg',
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        colors(context).iconSoft, BlendMode.srcIn),
                  ),
                  suffix: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: colors(context).iconSoft,
                  ),
                  label: 'base.actions.sort'.tr(),
                ),
                const Width(14),
                AppElevatedButton(
                  onPressed: () {
                    showAdaptiveDialog<ProductAttribute?>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            backgroundColor: colors(context).bgWhite,
                            content: const ContentCreateOption(),
                          );
                        }).then((value) {
                      if (value is ProductAttribute) {
                        controller.addProductAttribute(value);
                      }
                    });
                  },
                  borderRadius: 8,
                  padding: const EdgeInsets.all(6),
                  prefix: Icon(
                    Icons.add_circle_outline,
                    color: colors(context).white,
                    size: 20,
                  ),
                  label: 'product.attributes.add_product'.tr(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: colors(context).bgWeak,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            'product.attributes.label'.tr(),
                            style: AppTextStyles.paragraphSmall
                                .copyWith(color: colors(context).textSub),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            'product.attributes.amount'.tr(),
                            style: AppTextStyles.paragraphSmall
                                .copyWith(color: colors(context).textSub),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            'product.attributes.price'.tr(),
                            style: AppTextStyles.paragraphSmall
                                .copyWith(color: colors(context).textSub),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          'base.actions.label'.tr(),
                          style: AppTextStyles.paragraphSmall
                              .copyWith(color: colors(context).textSub),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<ProductController>(
                  builder: (context, controller, child) => ListView.separated(
                    itemCount: controller.options.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) => ItemProductAttribute(
                      item: controller.options[i],
                    ),
                    separatorBuilder: (context, i) => const Height(8),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

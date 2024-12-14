import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/item_status.dart';
import '/shared/widgets/sizes.dart';
import '../provider/product_attributes_controller.dart';
import 'content_capacity_field.dart';
import 'content_colors_field.dart';
import 'content_three_dimensional_field.dart';
import 'content_two_dimensional_field.dart';
import 'content_weight_field.dart';

class CreateProductOptionBody extends StatelessWidget {
  const CreateProductOptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ItemStatus(
            typeLabel: 'product.attributes.status_label'.tr(),
            status: context.watch<ProductAttributesController>().status,
            onStatusChange:
                context.read<ProductAttributesController>().toggleStatus,
          ),
          const Height(12.0),
          const ContentColorsField(),
          const Height(12.0),
          const ContentWeightField(),
          const Height(12.0),
          const ContentCapacityField(),
          const Height(12.0),
          const ContentTwoDimensionalField(),
          const Height(12.0),
          const ContentThreeDimensionalField(),
          const Height(12.0),
          AppTextField(
            controller: context.read<ProductAttributesController>().amountEditingController,
            label: "product.attributes.amount".tr(),
            isRequired: true,
            hint: 'product.attributes.input_type'.tr(),
            suffix: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'product.attributes.amount_hint'.tr(),
                style: AppTextStyles.paragraphSmall.copyWith(
                  color: colors(context).textSub, // Match the style as needed
                ),
              ),
            ),
          ),
          const Height(12.0),
          AppTextField(
            controller: context.read<ProductAttributesController>().priceEditingController,
            label: "product.attributes.price".tr(),
            isRequired: true,
            hint: 'product.attributes.price_currency'.tr(),
          ),
          const Height(12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: AppTextField(
                    controller: context.read<ProductAttributesController>().discountPriceEditingController,
                label: 'product.attributes.discount'.tr(),
                subLabel: 'product.attributes.type_price'.tr(),
                hint: 'product.attributes.price_currency'.tr(),
              )),
              const Width(12.0),
              AppOutlinedButton(
                padding: const EdgeInsets.all(10.0),
                borderRadius: 10,
                prefix: SvgPicture.asset(
                  'assets/icons/ic_arrows_rl.svg',
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                      colors(context).iconStrong, BlendMode.srcIn,
                  ),
                ),
              ),
              const Width(12.0),
              Expanded(
                  child: AppTextField(
                    controller: context.read<ProductAttributesController>().discountPercentEditingController,
                label: 'product.attributes.discount'.tr(),
                subLabel: 'product.attributes.type_percent'.tr(),
                hint: '20%...',
              ))
            ],
          )
        ],
      ),
    );
  }
}

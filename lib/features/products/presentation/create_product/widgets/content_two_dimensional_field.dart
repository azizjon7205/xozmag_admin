import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/styles/app_theme.dart';
import '../../../../../shared/widgets/app_text_field.dart';
import '../../../../../shared/widgets/sizes.dart';
import '../provider/product_attributes_controller.dart';

class ContentTwoDimensionalField extends StatefulWidget {
  const ContentTwoDimensionalField({super.key});

  @override
  State<ContentTwoDimensionalField> createState() =>
      _ContentTwoDimensionalFieldState();
}

class _ContentTwoDimensionalFieldState
    extends State<ContentTwoDimensionalField> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  void onValueChecked(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              splashRadius: 0,
              value: isChecked,
              onChanged: onValueChecked,
            ),
            Text(
              'product.attributes.two_dimensional'.tr(),
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).textStrong,
              ),
            ),
            Text(
              '* ',
              style: AppTextStyles.labelSmall
                  .copyWith(color: colors(context).primary),
            ),
          ],
        ),
        const Height(8),
        AppTextField(
          controller: context.read<ProductAttributesController>().twoDimensionHeightController,
          hint: 'product.attributes.height'.tr(),
          isDisabled: !isChecked,
          suffix: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('mm',style: AppTextStyles.paragraphSmall.copyWith(
              color: colors(context).textSub, // Match the style as needed
            ),),
          ),
        ),
        const Height(12),
        AppTextField(
          controller: context.read<ProductAttributesController>().twoDimensionWidthController,
          hint: 'product.attributes.width'.tr(),
          isDisabled: !isChecked,
          suffix: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('mm',style: AppTextStyles.paragraphSmall.copyWith(
              color: colors(context).textSub, // Match the style as needed
            ),),
          ),
        ),
      ],
    );
  }
}

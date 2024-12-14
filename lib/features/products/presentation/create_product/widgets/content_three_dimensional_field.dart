import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_attributes_controller.dart';
import '/shared/widgets/app_text_field.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';

class ContentThreeDimensionalField extends StatefulWidget {
  const ContentThreeDimensionalField({super.key});

  @override
  State<ContentThreeDimensionalField> createState() => _ContentThreeDimensionalFieldState();
}

class _ContentThreeDimensionalFieldState extends State<ContentThreeDimensionalField> {

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
              'product.attributes.three_dimensional'.tr(),
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
          controller: context.read<ProductAttributesController>().threeDimensionHeightController,
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
          controller: context.read<ProductAttributesController>().threeDimensionWidthController,
          hint: 'product.attributes.width'.tr(),
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
          controller: context.read<ProductAttributesController>().threeDimensionThickController,
          hint: 'product.attributes.thick'.tr(),
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

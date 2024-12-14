import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/products/presentation/create_product/provider/product_attributes_controller.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';

class ContentWeightField extends StatefulWidget {
  const ContentWeightField({super.key});

  @override
  State<ContentWeightField> createState() => _ContentWeightFieldState();
}

class _ContentWeightFieldState extends State<ContentWeightField> {

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
              'product.attributes.weight'.tr(),
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
          controller: context.read<ProductAttributesController>().weightEditingController,
          hint: 'product.attributes.input_type'.tr(),
          isDisabled: !isChecked,
          suffix: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('kg',style: AppTextStyles.paragraphSmall.copyWith(
              color: colors(context).textSub, // Match the style as needed
            ),),
          ),
        ),
      ],
    );
  }
}

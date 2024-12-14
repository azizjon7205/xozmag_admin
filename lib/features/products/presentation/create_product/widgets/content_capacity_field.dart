import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_attributes_controller.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';

class ContentCapacityField extends StatefulWidget {
  const ContentCapacityField({super.key});

  @override
  State<ContentCapacityField> createState() => _ContentCapacityFieldState();
}

class _ContentCapacityFieldState extends State<ContentCapacityField> {
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
              'product.attributes.capacity'.tr(),
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
        const Height(4),
        AppTextField(
          controller: context.read<ProductAttributesController>().capacityEditingController,
          hint: 'product.attributes.input_type'.tr(),
          isDisabled: !isChecked,
          suffix: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('litr',style: AppTextStyles.paragraphSmall.copyWith(
              color: colors(context).textSub, // Match the style as needed
            ),),
          ),
        ),
      ],
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/product_color.dart';
import '../provider/product_attributes_controller.dart';

class ContentColorsField extends StatefulWidget {
  const ContentColorsField({super.key});

  @override
  State<ContentColorsField> createState() => _ContentColorsFieldState();
}

class _ContentColorsFieldState extends State<ContentColorsField> {
  late bool isChecked;
  late bool isMenuExpanded;

  @override
  void initState() {
    isChecked = false;
    isMenuExpanded = false;
    super.initState();
  }

  void onMenuStateChanged(bool value) {
    setState(() {
      isMenuExpanded = value;
    });
  }

  void onValueChecked(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductAttributesController>();
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
              'product.attributes.colors_label'.tr(),
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).textStrong,
              ),
            ),
          ],
        ),
        const Height(4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<ProductColor>(
            onMenuStateChange: onMenuStateChanged,
            alignment: Alignment.center,
            isExpanded: false,
            menuItemStyleData: const MenuItemStyleData(
              overlayColor: WidgetStateColor.transparent,
            ),
            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -8),
              maxHeight: 300,
              scrollPadding: const EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                color: colors(context).bgWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0E121B1A).withOpacity(0.1),
                    offset: const Offset(0, 16),
                    spreadRadius: -12,
                    blurRadius: 32,
                  )
                ],
              ),
            ),
            onChanged: (value) {},
            buttonStyleData: const ButtonStyleData(
                overlayColor: WidgetStateColor.transparent),
            customButton: Box(
              radius: 10,
              color:
                  isChecked ? colors(context).bgWhite : colors(context).bgWeak,
              shadows: isMenuExpanded
                  ? [
                      const BoxShadow(
                        color: PaletteTokens.neutralAlpha16,
                        spreadRadius: 4,
                      ),
                      BoxShadow(
                        color: colors(context).bgWhite,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
              border: isMenuExpanded
                  ? Border.all(color: colors(context).strokeStrong)
                  : !isChecked
                      ? const Border.fromBorderSide(BorderSide.none)
                      : null,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              onTap: isChecked ? null : () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.color?.name ??
                        'product.attributes.color_hint'.tr(),
                    style: AppTextStyles.paragraphSmall.copyWith(
                        color: isChecked
                            ? colors(context).textStrong
                            : colors(context).textDisabled),
                  ),
                  Icon(
                    isMenuExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 20,
                    color: isChecked
                        ? colors(context).iconSub
                        : colors(context).iconDisabled,
                  )
                ],
              ),
            ),
            items:
                context.read<ProductAttributesController>().colors.map((item) {
              return DropdownMenuItem(
                onTap: () {
                  context.read<ProductAttributesController>().selectColor(item);
                },
                value: item,
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: controller.color?.id == item.id ? 4 : 2,
                              color: controller.color?.id == item.id
                                  ? colors(context).primary
                                  : colors(context).strokeSoft,
                          ),
                      ),
                    ),
                    const Width(8.0),
                    Expanded(
                      child: Text(
                        item.name,
                        style: AppTextStyles.paragraphSmall
                            .copyWith(color: colors(context).textStrong,
                        ),
                      ),
                    ),
                    const Width(8.0),
                    Container(
                      width: 20,
                      height: 16,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2.0),
                      decoration: BoxDecoration(
                          color: item.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Container(
                          width: 7.5,
                          height: 7.5,
                          decoration: BoxDecoration(
                            color: item.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

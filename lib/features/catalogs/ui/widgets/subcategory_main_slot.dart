import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/models/menu_item.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';

class SubcategoryMainSlot extends StatefulWidget {
  const SubcategoryMainSlot({super.key});

  @override
  State<SubcategoryMainSlot> createState() => _SubcategoryMainSlotState();
}

class _SubcategoryMainSlotState extends State<SubcategoryMainSlot> {

  late bool isMenuExpanded;

  @override
  void initState() {
    isMenuExpanded = false;
    super.initState();
  }

  void onMenuStateChanged(bool value) {
    setState(() {
      isMenuExpanded = value;
    });
  }

  List<DropdownMenuItem<MenuItem>> menuItems = [

    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash1'),
        child: Text("data1"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash2'),
        child: Text('data2'),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash3'),
        child: Text("data3"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash4'),
        child: Text('data4'),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash5'),
        child: Text("data5"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash6'),
        child: Text('data6'),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash3'),
        child: Text("data3"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash4'),
        child: Text('data4'),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash5'),
        child: Text("data5"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash6'),
        child: Text('data6'),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash3'),
        child: Text("data3"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash4'),
        child: Text('data4'),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash5'),
        child: Text("data5"),
    ),
    DropdownMenuItem(
        value: MenuItem(label: 'Tahrirlash6'),
        child: Text('data6'),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'category.label'.tr(),
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).textStrong,
              ),
            ),
            Text(
              ' * ',
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).primary,
              ),
            ),
            Text(
              'subcategory.category_label'.tr(),
              style: AppTextStyles.paragraphSmall.copyWith(
                color: colors(context).textSub,
              ),
            ),
          ],
        ),
        const Height(4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<MenuItem>(
            onMenuStateChange: onMenuStateChanged,
            alignment: Alignment.center,
            menuItemStyleData: const MenuItemStyleData(
                overlayColor: WidgetStateColor.transparent),
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
              overlayColor: WidgetStateColor.transparent
            ),
            customButton: Box(
                radius: 10,
                shadows: isMenuExpanded ? [
                  const BoxShadow(
                    color: PaletteTokens.neutralAlpha16,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: colors(context).bgWhite,
                    spreadRadius: 2,
                  ),

                ] : null,
                border: isMenuExpanded ? Border.all(color: colors(context).strokeStrong) : null,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('category.choose_hint'.tr(), style: AppTextStyles.paragraphSmall.copyWith(
                      color: colors(context).textStrong
                    ),),
                    Icon(isMenuExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 20, color: colors(context).iconSub,)
                  ],
                ),
            ),
            items: menuItems,
            dropdownSearchData: DropdownSearchData(
              searchInnerWidgetHeight: 36,
              searchInnerWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 8),
                child: AppTextField(
                  prefixIconSvgPath: 'assets/icons/ic_search.svg',
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  hint: "base.search_hint".tr(),
                ),
              )
            ),
          ),
        )
      ],
    );
  }
}

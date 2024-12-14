import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/category.dart';

class ItemProductCategory extends StatefulWidget {
  const ItemProductCategory({
    super.key,
    required this.categories,
    required this.category,
    required this.onCategorySelected,
    this.isSub = false,
  });

  final List<ProductCategory> categories;
  final ProductCategory? category;
  final bool isSub;
  final Function(ProductCategory) onCategorySelected;

  @override
  State<ItemProductCategory> createState() => _ItemProductCategoryState();
}

class _ItemProductCategoryState extends State<ItemProductCategory> {
  late bool isMenuExpanded;
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    isMenuExpanded = false;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onMenuStateChanged(bool value) {
    if (!value) {
      searchController.clear();
    }
    setState(() {
      isMenuExpanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              !widget.isSub
                  ? 'product.details.category'.tr()
                  : 'product.details.subcategory'.tr(),
              style: AppTextStyles.labelSmall.copyWith(
                color: widget.isSub && widget.categories.isEmpty
                    ? colors(context).textDisabled
                    : colors(context).textStrong,
              ),
            ),
            Text(
              ' * ',
              style: AppTextStyles.labelSmall.copyWith(
                color: widget.isSub && widget.categories.isEmpty
                    ? colors(context).textDisabled
                    : colors(context).primary,
              ),
            ),
          ],
        ),
        const Height(4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<ProductCategory>(
            onMenuStateChange: onMenuStateChanged,
            alignment: Alignment.center,
            menuItemStyleData: const MenuItemStyleData(
                overlayColor: WidgetStateColor.transparent),
            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -4),
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
            isExpanded: true,
            buttonStyleData: const ButtonStyleData(
                overlayColor: WidgetStateColor.transparent),
            customButton: Box(
              radius: 10,
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
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.category != null
                        ? widget.category!.name
                        : !widget.isSub
                            ? 'product.details.category_hint'.tr()
                            : 'product.details.subcategory_hint'.tr(),
                    style: AppTextStyles.paragraphSmall.copyWith(
                      color: widget.category != null
                          ? colors(context).textStrong
                          : widget.isSub && widget.categories.isEmpty
                              ? colors(context).textDisabled
                              : colors(context).textSoft,
                    ),
                  ),
                  Icon(
                    isMenuExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 20,
                    color: widget.isSub && widget.categories.isEmpty
                        ? colors(context).iconDisabled
                        : colors(context).iconSub,
                  )
                ],
              ),
            ),
            items: widget.categories
                .map((item) => DropdownMenuItem(
                      onTap: () {
                        widget.onCategorySelected(item);
                      },
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: item.id == widget.category?.id
                              ? colors(context).bgWeak
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: AppTextStyles.paragraphSmall.copyWith(
                                  color: colors(context).textStrong,
                                ),
                              ),
                            ),
                            if (widget.category?.id == item.id) ...[
                              const Width(8.0),
                              Icon(
                                Icons.check,
                                size: 20,
                                color: colors(context).iconStrong,
                              )
                            ]
                          ],
                        ),
                      ),
                    ))
                .toList(),
            dropdownSearchData: DropdownSearchData(
                searchController: searchController,
                searchInnerWidgetHeight: 36,
                searchInnerWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0)
                      .copyWith(top: 8),
                  child: AppTextField(
                    controller: searchController,
                    prefixIconSvgPath: 'assets/icons/ic_search.svg',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    hint: "base.search_hint".tr(),
                  ),
                ),
                searchMatchFn: (item, value) =>
                    item.value?.name
                        .toLowerCase()
                        .contains(value.toLowerCase()) ==
                    true),
          ),
        )
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/catalogs/domain/entities/subcategory.dart';

import '../../domain/entities/category.dart';
import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_theme.dart';
import '/shared/models/menu_item.dart';
import '/shared/widgets/sizes.dart';
import '/shared/widgets/spaced_row.dart';

class ItemListSubcategory extends StatelessWidget {
  const ItemListSubcategory({super.key, required this.category});

  final Subcategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navController.push(const ProductsRoute());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 4),
        decoration: BoxDecoration(
          border: Border.all(color: colors(context).strokeSoft),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SpacedRow(
          padding: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(16),
          spacing: 8,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: typography(context).bodyMedium?.copyWith(
                        color: colors(context).textStrong,
                        fontWeight: FontWeight.w500),
                  ),
                  const Height(4),
                  Text(
                    '${category.productsAmount} ta tovar',
                    style: typography(context).bodySmall?.copyWith(
                        color: colors(context).textSub,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<MenuItem>(
                  alignment: Alignment.center,
                  menuItemStyleData: const MenuItemStyleData(
                      overlayColor: WidgetStateColor.transparent),
                  dropdownStyleData: DropdownStyleData(
                    width: 300,
                    offset: const Offset(-264, -8),
                    // padding: const EdgeInsets.all(8.0),
                    scrollPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: colors(context).bgWhite,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: colors(context).strokeSoft,
                          strokeAlign: BorderSide.strokeAlignInside),
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
                  isExpanded: true,
                  onChanged: (value) {},
                  customButton: Container(
                    height: 36,
                    width: 36,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: colors(context).strokeSoft),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.more_vert_outlined,
                      color: colors(context).iconStrong,
                      size: 20,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: MenuItem(label: 'base.actions.edit'.tr()),
                      child: ListTile(
                        leading: Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: colors(context).iconSub,
                        ),
                        title: Text(
                          'base.actions.edit'.tr(),
                          style: typography(context).labelLarge?.copyWith(
                              color: colors(context).textStrong,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: MenuItem(label: 'Tovar qo\'shish'),
                      child: ListTile(
                        leading: Icon(
                          Icons.add_circle_outline,
                          size: 20,
                          color: colors(context).iconSub,
                        ),
                        title: Text(
                          'Tovar qo\'shish',
                          style: typography(context).labelLarge?.copyWith(
                              color: colors(context).textStrong,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: MenuItem(label: 'base.actions.delete'.tr()),
                      child: ListTile(
                        leading: Icon(
                          CupertinoIcons.delete,
                          size: 20,
                          color: colors(context).errorBase,
                        ),
                        title: Text(
                          'base.actions.delete'.tr(),
                          style: typography(context).labelLarge?.copyWith(
                              color: colors(context).errorBase,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
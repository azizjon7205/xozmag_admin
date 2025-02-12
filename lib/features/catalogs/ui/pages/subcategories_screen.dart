import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/styles/app_theme.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/subcategory.dart';
import '../widgets/create_subcategory_section.dart';
import '../widgets/item_list_subcategory.dart';

@RoutePage()
class SubcategoriesScreen extends StatelessWidget {
  const SubcategoriesScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppExpandedBar(
        title: category.name,
        subtitle: 'subcategory.subtitle'.tr(),
        actions: [
          const Width(20),
          AppOutlinedButton(
            onPressed: () {},
            borderRadius: 10.0,
            padding: const EdgeInsets.all(10.0),
            prefix: Icon(
              Icons.edit_outlined,
              size: 20,
              color: colors(context).iconSub,
            ),
          ),
          const Width(12),
          AppElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: colors(context).bgWhite,
                    content: const CreateSubcategorySection(),
                  );
                },
              );
            },
            label: 'subcategory.create_title'.tr(),
          ),
        ],
        bottom: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 32).copyWith(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: AppTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  hint: 'base.search_hint'.tr(),
                  prefixIconSvgPath: 'assets/icons/ic_search.svg',
                ),
              ),
              const Spacer(
                flex: 2,
              ),
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
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 16),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemListSubcategory(
                    category: Subcategory(
                  name: 'Test #$index',
                )),
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/main_controller.dart';
import 'package:xozmag_admin/shared/widgets/app_elevated_button.dart';

import '/core/styles/app_theme.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../../../../shared/widgets/item_list_category.dart';
import '../../domain/entities/category.dart';
import '../widgets/create_category_section.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppExpandedBar(
        title: 'category.title'.tr(),
        subtitle: 'category.subtitle'.tr(),
        onDrawerOpen: () {
          context.read<MainController>().scaffoldKey.currentState?.openDrawer();
        },
        actions: [
          const Width(20),
          AppElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: colors(context).bgWhite,
                    content: const CreateCategorySection(),
                  );
                },
              );
            },
            label: 'base.actions.add'.tr(),
          ),
        ],
        bottom: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32).copyWith(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Expanded(
                flex: 5,
                child: AppTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
        padding: const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 16),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemListCategory(category: Category(
                  name: 'Test #$index',
                  image: 'https://picsum.photos/id/1/200/300'
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

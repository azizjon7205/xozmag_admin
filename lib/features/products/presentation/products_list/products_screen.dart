import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_button.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../../domain/entities/product.dart';
import 'provider/products_controller.dart';
import 'widgets/item_list_product.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsController(),
      child: Scaffold(
        appBar: AppExpandedBar(
          title: 'Katalog nomi',
          subtitle: 'product.page_subtitle'.tr(),
          actions: [
            const Width(20),
            AppButton(
              width: null,
              onTap: () {
                navController.push(const CreateProductRoute());
              },
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Tovar qo\'shish'.tr(),
                  style: AppTextStyles.labelSmall.copyWith(
                    color: colors(context).white,
                  ),
                ),
              ),
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
                  (context, index) => ItemListProduct(
                    product: Product(
                      id: "1234235",
                      name: 'Test #$index',
                      image: 'https://picsum.photos/id/1/200/300',
                      amount: 23 + 2 * index,
                    ),
                  ),
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/item_list_category.dart';
import '../../../catalogs/domain/entities/category.dart';
import '/core/styles/app_box_shadows.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/box.dart';

class SlotCategories extends StatelessWidget {
  const SlotCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Box(
        radius: 10.0,
        color: colors(context).bgWhite,
        padding: const EdgeInsets.all(16.0),
        shadows: [AppBoxShadows.regularXSmall],
        child: Column(
          spacing: 16.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 8.0,
              children: [
                SvgPicture.asset('assets/icons/ic_apps_line.svg'),
                Text(
                  'category.title'.tr(),
                  style: AppTextStyles.labelMedium
                      .copyWith(color: colors(context).textStrong),
                ),
                Text(
                  '(10 223)',
                  style: AppTextStyles.labelXSmall
                      .copyWith(color: colors(context).textSub),
                ),
                Spacer(),
                Flexible(
                  flex: 2,
                  child: AppTextField(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    hint: 'base.search_hint'.tr(),
                    prefixIconSvgPath: 'assets/icons/ic_search.svg',
                  ),
                ),
              ],
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: colors(context).strokeSoft,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
                childAspectRatio:
                    (MediaQuery.of(context).size.width / 2 - 120) / 72,
              ),
              itemBuilder: (context, i) => ItemListCategory(
                category: Category(
                  name: 'Test #$i',
                  image: 'https://picsum.photos/id/1/200/300',
                ),
              ),
              itemCount: 7,
            )
          ],
        ),
      ),
    );
  }
}

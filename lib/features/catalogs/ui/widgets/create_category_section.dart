import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/router/router.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_button.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../provider/create_category_controller.dart';
import 'category_body.dart';

class CreateCategorySection extends StatelessWidget {
  const CreateCategorySection({super.key, this.category});

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.75,
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: ChangeNotifierProvider(
          create: (context) => CreateCategoryController(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  children: [
                    Box(
                      radius: 20,
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/ic_apps_line.svg',
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            colors(context).iconSoft, BlendMode.srcIn),
                      ),
                    ),
                    const Width(14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'category.create_title'.tr(),
                                  style: AppTextStyles.labelSmall.copyWith(
                                      color: colors(context).textStrong),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navController.maybePop();
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: colors(context).iconSub,
                                ),
                              )
                            ],
                          ),
                          const Height(4),
                          Text(
                            'category.create_subtitle'.tr(),
                            style: AppTextStyles.paragraphXSmall
                                .copyWith(color: colors(context).textSub),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: colors(context).strokeSoft,
              ),
              const CategoryBody(),
              Divider(
                height: 1,
                color: colors(context).strokeSoft,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          navController.maybePop();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'base.actions.cancel'.tr(),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: colors(context).textSub,
                          ),
                        ),
                      ),
                    ),
                    const Width(12),
                    Expanded(
                      child: AppButton(
                        onTap: () {},
                        height: 36,
                        widget: Text(
                          'base.actions.continue'.tr(),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: colors(context).white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

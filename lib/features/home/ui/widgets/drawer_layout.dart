import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/router/router.gr.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_outlined_button.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({super.key, required this.onCloseDrawer, required this.tabsRouter});

  final VoidCallback onCloseDrawer;
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    // final controller = context.read<HomeController>();
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              spacing: 12.0,
              children: [
                Icon(
                  Icons.menu,
                  color: colors(context).iconStrong,
                ),
                Expanded(
                  child: Text(
                    'home.drawer.menu'.tr(),
                    style: AppTextStyles.labelLarge
                        .copyWith(color: colors(context).textStrong),
                  ),
                ),
                AppOutlinedButton(
                  onPressed: onCloseDrawer,
                  borderRadius: 10,
                  padding: const EdgeInsets.all(10.0),
                  prefix: Icon(
                    Icons.skip_previous_outlined,
                    size: 20,
                    color: colors(context).iconStrong,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              spacing: 16.0,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: colors(context).bgWeak),
                  child: SvgPicture.asset(
                    'assets/icons/ic_avatar.svg',
                    height: 48,
                    width: 48,
                  ),
                ),
                Column(
                  spacing: 4.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User name',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: colors(context).textStrong),
                    ),
                    Text(
                      'user role',
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
            color: colors(context).bgWeak,
            child: Text(
              'home.drawer.sections'.tr().toUpperCase(),
              style: AppTextStyles.subheadXSmall
                  .copyWith(color: colors(context).textSoft),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 4.0,
                children: [
                  GestureDetector(
                    onTap: () {
                      tabsRouter.navigate(const HomeRoute());
                      onCloseDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: tabsRouter.current.name == HomeRoute.name
                            ? colors(context).bgWeak
                            : colors(context).bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        spacing: 6.0,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_home_line.svg',
                            colorFilter: ColorFilter.mode(
                              tabsRouter.current.name == HomeRoute.name
                                  ? colors(context).primary
                                  : colors(context).iconSub,
                              BlendMode.srcIn,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'home.drawer.main'.tr(),
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ),
                          if (tabsRouter.current.name == HomeRoute.name)
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors(context).bgWhite,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: colors(context).iconSub,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onCloseDrawer();
                      tabsRouter.navigate(const CategoriesRoute());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: tabsRouter.current.name == CategoriesRoute.name
                            ? colors(context).bgWeak
                            : colors(context).bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        spacing: 6.0,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_apps_line.svg',
                            colorFilter: ColorFilter.mode(
                              tabsRouter.current.name == CategoriesRoute.name
                                  ? colors(context).primary
                                  : colors(context).iconSub,
                              BlendMode.srcIn,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'home.drawer.categories'.tr(),
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ),
                          if (tabsRouter.current.name == CategoriesRoute.name)
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors(context).bgWhite,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: colors(context).iconSub,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tabsRouter.navigate(const CreateProductRoute());
                      onCloseDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: tabsRouter.current.name == CreateProductRoute.name
                            ? colors(context).bgWeak
                            : colors(context).bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        spacing: 6.0,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_menu_add_line.svg',
                            colorFilter: ColorFilter.mode(
                              tabsRouter.current.name == CreateProductRoute.name
                                  ? colors(context).primary
                                  : colors(context).iconSub,
                              BlendMode.srcIn,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'home.drawer.add_product'.tr(),
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ),
                          if (tabsRouter.current.name == CreateProductRoute.name)
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors(context).bgWhite,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: colors(context).iconSub,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tabsRouter.navigate(const StaffRoute());
                      onCloseDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: tabsRouter.current.name == StaffRoute.name
                            ? colors(context).bgWeak
                            : colors(context).bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        spacing: 6.0,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_team_line.svg',
                            colorFilter: ColorFilter.mode(
                              tabsRouter.current.name == StaffRoute.name
                                  ? colors(context).primary
                                  : colors(context).iconSub,
                              BlendMode.srcIn,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'home.drawer.staff'.tr(),
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ),
                          if (tabsRouter.current.name == StaffRoute.name)
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors(context).bgWhite,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: colors(context).iconSub,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tabsRouter.navigate(const OrdersRoute());
                      onCloseDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: tabsRouter.current.name == OrdersRoute.name
                            ? colors(context).bgWeak
                            : colors(context).bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        spacing: 6.0,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_shopping_line.svg',
                            colorFilter: ColorFilter.mode(
                              tabsRouter.current.name == OrdersRoute.name
                                  ? colors(context).primary
                                  : colors(context).iconSub,
                              BlendMode.srcIn,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'home.drawer.orders'.tr(),
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ),
                          if (tabsRouter.current.name == OrdersRoute.name)
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors(context).bgWhite,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: colors(context).iconSub,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 4.0,
              children: [
                GestureDetector(
                  onTap: () {
                    // tabsRouter.navigate(const SettingsRoute());
                    onCloseDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: tabsRouter.current.name == SettingsRoute.name
                          ? colors(context).bgWeak
                          : colors(context).bgWhite,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      spacing: 6.0,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_settings_line.svg',
                          colorFilter: ColorFilter.mode(
                            tabsRouter.current.name == SettingsRoute.name
                                ? colors(context).primary
                                : colors(context).iconSub,
                            BlendMode.srcIn,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'home.drawer.settings'.tr(),
                            style: AppTextStyles.labelSmall
                                .copyWith(color: colors(context).textStrong),
                          ),
                        ),
                        if (tabsRouter.current.name == SettingsRoute.name)
                          Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors(context).bgWhite,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: colors(context).iconSub,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: logout
                    onCloseDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: colors(context).bgWhite,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      spacing: 6.0,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_logout_line.svg',
                          colorFilter: ColorFilter.mode(
                            colors(context).errorBase,
                            BlendMode.srcIn,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'home.drawer.logout'.tr(),
                            style: AppTextStyles.labelSmall
                                .copyWith(color: colors(context).errorBase),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

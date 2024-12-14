import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xozmag_admin/core/router/router.dart';
import 'package:xozmag_admin/shared/widgets/app_outlined_button.dart';

import '../../core/styles/app_text_styles.dart';
import '../../core/styles/app_theme.dart';
import 'sizes.dart';

class AppExpandedBar extends StatelessWidget implements PreferredSizeWidget {
  const AppExpandedBar({
    super.key,
    this.hasLeading = true,
    this.leading,
    required this.title,
    this.subtitle,
    this.actions,
    this.height = 64,
    this.backgroundColor,
    this.centerTitle = false,
    this.bottom,
  });

  final bool hasLeading;
  final Widget? leading;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final double height;
  final Color? backgroundColor;
  final bool centerTitle;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: colors(context).bgWhite,
      toolbarHeight: height,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          children: [
            if (hasLeading) ...[
              AppOutlinedButton(
                onPressed: () {
                  navController.maybePop();
                },
                prefix: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: colors(context).iconSub,
                ),
                label: 'base.actions.back'.tr(),
              ),
              const Width(20)
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colors(context).textStrong,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const Height(4),
                    Text(
                      subtitle!,
                      maxLines: 2,
                      style: AppTextStyles.paragraphXSmall.copyWith(
                        color: colors(context).textSub,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (actions?.isNotEmpty == true) ...actions!
          ],
        ),
      ),
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: bottom ?? Container(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height + (bottom != null ? 56.0 : 0.0));
}

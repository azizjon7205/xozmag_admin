import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xozmag_admin/core/router/router.dart';
import 'package:xozmag_admin/core/router/router.gr.dart';

import '../../../../core/styles/app_theme.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/sizes.dart';

class LoginActionsSlot extends StatelessWidget {
  const LoginActionsSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextField(
          label: 'login.login_label'.tr(),
          prefixIconSvgPath: 'assets/icons/ic_user_line.svg',
          hint: 'login.login_label'.tr(),
        ),
        const Height(12),
        AppTextField(
          label: 'login.password_label'.tr(),
          prefixIconSvgPath: 'assets/icons/ic_lock.svg',
          hint: 'login.password_label'.tr(),
          obscureText: true,
        ),
        const Height(24),
        AppButton(
          onTap: () {
            navController.push(const CategoriesRoute());
          },
          widget: Text(
            'login.login_label'.tr(),
            style: typography(context).labelLarge?.copyWith(
                color: colors(context).white,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

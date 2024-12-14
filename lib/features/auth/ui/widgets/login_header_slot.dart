import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/app_theme.dart';
import '../../../../shared/widgets/sizes.dart';
import '../../../../shared/widgets/svg_gradient.dart';

class LoginHeaderSlot extends StatelessWidget {
  const LoginHeaderSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SvgGradient(svgImage: 'assets/icons/ic_user_fill.svg'),
        const Height(8),
        Text(
          'login.title'.tr(),
          style: typography(context).headlineSmall?.copyWith(
              color: colors(context).textStrong,
              fontWeight: FontWeight.w500),
        ),
        const Height(4),
        Text(
          'login.subtitle'.tr(),
          style: typography(context).titleMedium?.copyWith(
              color: colors(context).textSub,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

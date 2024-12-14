import 'package:flutter/material.dart';

import '../../../../core/styles/app_theme.dart';
import '../../../../shared/widgets/sizes.dart';
import 'login_actions_slot.dart';
import 'login_header_slot.dart';

class LoginLandscapeMode extends StatelessWidget {
  const LoginLandscapeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colors(context).strokeSoft,
            width: 1,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LoginHeaderSlot(),
          const Width(24),
          // VerticalDivider(
          //   width: 1,
          //   color: colors(context).strokeSoft,
          // ),
          const Width(24),
          Flexible(child: Container(
              constraints: const BoxConstraints(maxWidth: 440),
              child: const LoginActionsSlot()))
        ],
      ),
    );
  }
}

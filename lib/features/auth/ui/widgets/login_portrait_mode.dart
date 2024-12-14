import 'package:flutter/material.dart';

import '../../../../core/styles/app_theme.dart';
import '../../../../shared/widgets/sizes.dart';
import 'login_actions_slot.dart';
import 'login_header_slot.dart';

class LoginPortraitMode extends StatelessWidget {
  const LoginPortraitMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colors(context).strokeSoft,
            width: 1,
          ),
      ),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 440),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginHeaderSlot(),
          const Height(24),
          Divider(
            height: 1,
            color: colors(context).strokeSoft,
          ),
          const Height(24),
          const LoginActionsSlot()
        ],
      ),
    );
  }
}

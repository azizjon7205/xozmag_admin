import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/auth/ui/widgets/login_landscape_mode.dart';
import 'package:xozmag_admin/features/auth/ui/widgets/login_portrait_mode.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight >= 600) {
          return const LoginPortraitMode();
        } else {
          return const LoginLandscapeMode();
        }
      },
    );
  }
}

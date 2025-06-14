import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/auth/ui/widgets/login_body.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginBody(),
      ),
    );
  }
}

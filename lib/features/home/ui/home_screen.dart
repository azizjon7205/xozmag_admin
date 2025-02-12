import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../staff/ui/provider/staff_controller.dart';
import 'provider/home_controller.dart';
import 'widgets/home_section.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController(),),
        ChangeNotifierProvider(create: (context) => StaffController(),),
      ],
      builder: (context, controller) => const HomeSection(),
    );
  }
}

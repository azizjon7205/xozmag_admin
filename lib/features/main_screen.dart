import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/router/router.gr.dart';
import '/core/styles/app_theme.dart';
import '/features/home/ui/widgets/drawer_layout.dart';
import '/features/main_controller.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainController>(
      create: (context) => MainController(),
      builder: (context, child) => AutoTabsRouter(
        routes: const [
          HomeRoute(),
          CategoriesRoute(),
          StaffRoute(),
          OrdersRoute(),
          CreateProductRoute(),
          SettingsRoute()
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            key: context.read<MainController>().scaffoldKey,
            drawer: Drawer(
              backgroundColor: colors(context).bgWhite,
              child: DrawerLayout(
                  tabsRouter: tabsRouter,
                  onCloseDrawer: () {
                    (context.read<MainController>().scaffoldKey.currentState
                            as ScaffoldState)
                        .closeDrawer();
                  }),
            ),
            body: child,
          );
        },
      ),
    );
  }
}

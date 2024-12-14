import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/translations.dart';

import '/core/router/router.dart';
import '/features/products/presentation/create_product/custom/app_quill_localizations.dart';
import 'core/styles/app_theme.dart';
import 'core/styles/colors/app_dark_palette.dart';
import 'core/styles/colors/app_light_palette.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      locale: context.locale,
      localizationsDelegates: [
        ...context.localizationDelegates,
        FlutterQuillLocalizations.delegate,
        AppQuillLocalizationDelegate()
      ],
      supportedLocales: context.supportedLocales,
      title: 'Xozmag Admin',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context, AppLightPalette(), Brightness.light),
      darkTheme: getAppTheme(context, AppDarkPalette(), Brightness.dark),
      routerDelegate: navController.delegate(),
      routeInformationParser: navController.defaultRouteParser(),
    );
  }

}

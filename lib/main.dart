import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xozmag_admin/app.dart';
import 'package:xozmag_admin/shared/models/app_lang.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    EasyLocalization(
      supportedLocales: AppLang.values.map((e) => e.locale).toList(),
      fallbackLocale: AppLang.cyrillic.locale,
      startLocale: AppLang.cyrillic.locale,
      path: 'assets/locales',
      child: DevicePreview(
          enabled: !kReleaseMode && false,
          builder: (context) => const AdminApp()),
    ),
  );
}

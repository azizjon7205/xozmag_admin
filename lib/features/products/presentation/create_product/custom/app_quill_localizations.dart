import 'package:flutter/material.dart';
import 'package:flutter_quill/translations.dart';

import 'quill_localizations_uz.dart';
import 'quill_localizations_uz_cyrl.dart';


class AppQuillLocalizationDelegate
    extends LocalizationsDelegate<FlutterQuillLocalizations> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'uz';

  @override
  Future<FlutterQuillLocalizations> load(Locale locale) async {
    switch (locale.countryCode) {
      case 'Cyrl':
        return FlutterQuillLocalizationsUzCyrl();

    }
    return FlutterQuillLocalizationsUz();
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<FlutterQuillLocalizations> old) {
    return false;
  }
}

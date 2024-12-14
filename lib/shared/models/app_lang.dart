
import 'dart:ui';

enum AppLang { uzbek, russian, cyrillic}

extension AppLangExtension on AppLang {
  Locale get locale => Locale(code, region);

  String get code {
    switch (this) {
      case AppLang.uzbek:
        return 'uz';
      case AppLang.russian:
        return 'ru';
      case AppLang.cyrillic:
        return 'uz';
    }
  }

  String get region {
    switch (this) {
      case AppLang.uzbek:
        return 'UZ';
      case AppLang.russian:
        return 'RU';
      case AppLang.cyrillic:
        return "Cyrl";
    }
  }
}
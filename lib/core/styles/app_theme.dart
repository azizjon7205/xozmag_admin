import 'package:flutter/material.dart';
import 'package:xozmag_admin/core/styles/app_text_styles.dart';

import 'colors/app_dark_palette.dart';
import 'colors/app_light_palette.dart';
import 'colors/palette.dart';

AppPalette colors(context) => Theme.of(context).appColors;
TextTheme typography(context) => Theme.of(context).textTheme;

ThemeData getAppTheme(BuildContext context, AppPalette palette, Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primaryColor: palette.primary,
    scaffoldBackgroundColor: palette.bgWhite,
    appBarTheme: AppBarTheme(color: palette.bgWhite),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
        backgroundColor: palette.primary,
        foregroundColor: palette.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      isDense: true,
      prefixIconColor: palette.iconSoft,
      hintStyle: AppTextStyles.paragraphSmall.copyWith(
        color: palette.textSoft,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: palette.strokeSoft),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: palette.strokeSoft),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: palette.primary),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: palette.errorBase),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: palette.errorBase),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
      ),

    ),
    checkboxTheme: _checkboxThemeData(palette),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: palette.strokeSoft),
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      )
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return palette.primary;
        }
        return colors(context).strokeSoft;
      })
    ),
    datePickerTheme: DatePickerThemeData(
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return palette.primary;
        }
        return Colors.transparent;
      }),
      todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return palette.primary;
        }
        return Colors.transparent;
      }),
      todayBorder: BorderSide(
          color: palette.strokeSoft,width: 1
      ),
      dayShape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
      ),
      dayStyle: AppTextStyles.paragraphLarge,
      yearStyle: AppTextStyles.subheadMedium,
      headerHeadlineStyle: AppTextStyles.subheadMedium,
    )
  );
}

CheckboxThemeData _checkboxThemeData(AppPalette palette) => CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: WidgetStateBorderSide.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return const BorderSide(
            width: 2,
            color: Colors.transparent,
          );
        }
        return BorderSide(
          width: 2,
          color: palette.primary,
        );
      },
    ),
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.disabled)) {
      return palette.primary;
    } else if (states.contains(WidgetState.dragged)) {
      return palette.primary;
    } else if (states.contains(WidgetState.error)) {
      return palette.primary;
    } else if (states.contains(WidgetState.focused)) {
      return palette.primary;
    } else if (states.contains(WidgetState.hovered)) {
      return palette.primary;
    } else if (states.contains(WidgetState.pressed)) {
      return palette.primary;
    } else if (states.contains(WidgetState.scrolledUnder)) {
      return palette.primary;
    } else if (states.contains(WidgetState.selected)) {
      return palette.primary;
    }
    return Colors.transparent;
  }),
  checkColor: WidgetStatePropertyAll(palette.white),
  side: WidgetStateBorderSide.resolveWith(
        (states) {
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(
          width: 2,
          color: Colors.transparent,
        );
      }
      return BorderSide(
        width: 2,
        color: palette.primary,
      );
    },
  ),

);

extension AppTheme on ThemeData {
  AppPalette get appColors {
    return brightness == Brightness.light ? AppLightPalette() : AppDarkPalette();
  }
}

extension AppExtension on ThemeExtension {

}

// class AppColors extends ThemeExtension<AppColors> {
//
//   final Color? primary;
//   final Color? primaryDark;
//   final Color? primaryDarker;
//   final Color? primaryAlpha16;
//   final Color? primaryAlpha10;
//
//   final Color? black;
//   final Color? white;
//
//   final Color? bgStrong;
//   final Color? bgSurface;
//   final Color? bgSoft;
//   final Color? bgWeak;
//   final Color? bgWhite;
//
//   final Color? textStrong;
//   final Color? textSub;
//   final Color? textSoft;
//   final Color? textDisabled;
//   final Color? textWhite;
//
//   final Color? strokeStrong;
//   final Color? strokeSub;
//   final Color? strokeSoft;
//   final Color? strokeWhite;
//
//   final Color? iconStrong;
//   final Color? iconSub;
//   final Color? iconSoft;
//   final Color? iconDisabled;
//   final Color? iconWhite;
//
//   final Color? white;
//   final Color? white;
//   final Color? white;
//
//
//   @override
//   ThemeExtension<AppColors> copyWith() {
//
//     throw UnimplementedError();
//   }
//
//   @override
//   ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
//     if (other is! AppColors) {
//       return this;
//     }
//
//     throw UnimplementedError();
//   }
//
// }


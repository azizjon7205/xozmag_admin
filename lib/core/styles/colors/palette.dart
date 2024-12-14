import 'package:flutter/material.dart';

abstract interface class AppPalette {
  Color get primary;
  Color get primaryDark;
  Color get primaryDarker;
  Color get primaryAlpha16;
  Color get primaryAlpha10;

  Color get black;
  Color get white;

  Color get bgStrong;
  Color get bgSurface;
  Color get bgSub;
  Color get bgSoft;
  Color get bgWeak;
  Color get bgWhite;

  Color get textStrong;
  Color get textSub;
  Color get textSoft;
  Color get textDisabled;
  Color get textWhite;

  Color get strokeStrong;
  Color get strokeSub;
  Color get strokeSoft;
  Color get strokeWhite;

  Color get iconStrong;
  Color get iconSub;
  Color get iconSoft;
  Color get iconDisabled;
  Color get iconWhite;

  Color get warningDark;
  Color get warningBase;
  Color get warningLight;
  Color get warningLighter;

  Color get errorDark;
  Color get errorBase;
  Color get errorLight;
  Color get errorLighter;

  Color get infoDark;
  Color get infoBase;
  Color get infoLight;
  Color get infoLighter;

  Color get successDark;
  Color get successBase;
  Color get successLight;
  Color get successLighter;

  Color get awayDark;
  Color get awayBase;
  Color get awayLight;
  Color get awayLighter;

}

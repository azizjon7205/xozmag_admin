import 'package:flutter/material.dart';
import 'package:xozmag_admin/core/styles/app_box_shadows.dart';
import '../../../../core/styles/app_theme.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.border,
    this.radius = 16.0,
    this.onTap,
    this.shadows,
    required this.child,
  });

  final Widget child;
  final Color? color;
  final BoxBorder? border;
  final double radius;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding ?? const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: border ?? Border.all(color: colors(context).strokeSoft),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadows ?? [
            AppBoxShadows.regularXSmall
          ]
        ),
        child: child,
      ),
    );
  }
}

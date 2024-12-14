import 'package:flutter/material.dart';
import '../../../../core/styles/app_theme.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.border,
    this.radius = 0.0,
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
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: border ?? Border.all(color: colors(context).strokeSoft),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadows
        ),
        child: child,
      ),
    );
  }
}

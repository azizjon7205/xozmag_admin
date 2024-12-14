import 'dart:math';

import 'package:flutter/material.dart';

class SpacedColumn extends StatelessWidget {
  const SpacedColumn({
    this.spacing,
    this.padding,
    this.color,
    this.borderRadius,
    this.borderColor,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    required this.children,
    super.key,
  });

  final double? spacing;
  final EdgeInsets? padding;
  final List<Widget> children;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.zero),
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          children: List<Widget>.generate(
            max(2 * children.length - 1, 0),
            (index) {
              if (index % 2 == 0) {
                var i = index ~/ 2;
                var widget = children.elementAtOrNull(i);
                if (widget != null) {
                  return widget;
                } else {
                  return Container();
                }
              } else {
                return SizedBox(
                  height: spacing ?? 0,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

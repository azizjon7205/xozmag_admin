import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget {
  const SpacedRow({
    this.spacing,
    this.padding,
    this.margin,
    this.color,
    this.borderRadius,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.border,
    required this.children,
    super.key,
  });

  final double? spacing;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final List<Widget> children;
  final Color? color;
  final BorderRadius? borderRadius;
  final Border? border;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        clipBehavior: Clip.none,
        borderRadius: borderRadius,
        color: color ?? Colors.transparent,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: List<Widget>.generate(
              2 * children.length - 1,
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
                    width: spacing ?? 0,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

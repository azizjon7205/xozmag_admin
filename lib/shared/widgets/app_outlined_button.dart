import 'package:flutter/material.dart';

import '/core/styles/app_box_shadows.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import 'box.dart';
import 'sizes.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {super.key,
      this.prefix,
      this.suffix,
      this.width,
      this.isLabelPrimary = false,
      this.isWidthMatch = false,
      this.borderRadius = 8,
        this.padding,
      this.onPressed,
        this.isEnabled = true,
       this.label});

  final double? width;
  final Widget? prefix;
  final Widget? suffix;
  final String? label;
  final bool isEnabled;
  final bool isLabelPrimary;
  final bool isWidthMatch;
  final double borderRadius;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Box(
      onTap: isEnabled ? onPressed : null,
      padding: padding ?? const EdgeInsets.all(8.0).copyWith(left: 10.0),
      radius: borderRadius,
      color: isEnabled ? colors(context).bgWhite : colors(context).bgWeak,
      shadows: [AppBoxShadows.regularXSmall],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: isWidthMatch ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (prefix != null) ...[
            prefix ?? const SizedBox.shrink(),
            if (label != null) const Width(4),
          ],
          if (label != null)
            ...[
              const Width(4),
              Text(
                label!,
                style: AppTextStyles.paragraphSmall
                    .copyWith(color: isEnabled ? colors(context).textSub : colors(context).textDisabled),
              ),
              const Width(4),
            ],

          if (isWidthMatch) const Spacer(),
          if (suffix != null) ...[
            const Width(4),
            suffix ?? const SizedBox.shrink(),
          ],
        ],
      ),
    );
  }
}

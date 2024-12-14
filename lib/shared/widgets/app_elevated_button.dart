import 'package:flutter/material.dart';

import '../../core/styles/app_box_shadows.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/styles/app_theme.dart';
import '../../shared/widgets/box.dart';
import 'sizes.dart';

class AppElevatedButton extends StatelessWidget {

  const AppElevatedButton(
      {super.key,
      this.prefix,
      this.suffix,
      this.isLabelPrimary = false,
        this.isEnabled = true,
      this.borderRadius = 10,
        this.padding,
      this.onPressed,
      required this.label});

  final Widget? prefix;
  final Widget? suffix;
  final String label;
  final bool isEnabled;
  final bool isLabelPrimary;
  final double borderRadius;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Box(
      onTap: isEnabled ? onPressed : null,
      padding: padding ?? const EdgeInsets.all(10.0),
      radius: borderRadius,
      color: isEnabled ? colors(context).primary : colors(context).bgWeak,
      border: !isEnabled ? const Border.fromBorderSide(BorderSide.none) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefix != null) ...[
            prefix ?? const SizedBox.shrink(),
            const Width(4),
          ],
          const Width(4),
          Text(
            label,
            style: AppTextStyles.labelSmall
                .copyWith(color: isEnabled ? colors(context).white : colors(context).textDisabled),
          ),
          const Width(4),
          if (suffix != null) ...[
            const Width(4),
            suffix ?? const SizedBox.shrink(),
          ],
        ],
      ),
    );
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0).copyWith(left: 10.0),
        decoration: BoxDecoration(
            color: colors(context).bgWhite,
            border: Border.all(color: colors(context).strokeSoft),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [AppBoxShadows.regularXSmall]),
        child: Row(
          children: [
            if (prefix != null) ...[
              prefix ?? const SizedBox.shrink(),
              const Width(4),
            ],
            Text(
              label,
              style: AppTextStyles.paragraphSmall
                  .copyWith(color: colors(context).textSub),
            ),
            if (suffix != null) ...[
              const Width(4),
              suffix ?? const SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }

  Color _getColorByState(BuildContext context) {
    return isEnabled ? colors(context).primary : colors(context).bgWeak;
  }
}

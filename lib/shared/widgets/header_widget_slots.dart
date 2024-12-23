import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import 'sizes.dart';

class HeaderWidgetSlots extends StatelessWidget {
  const HeaderWidgetSlots({
    super.key,
    this.prefixSvgPath,
    required this.label,
    this.suffix,
    this.padding,
  });

  final String? prefixSvgPath;
  final String label;
  final Widget? suffix;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16.0).copyWith(left: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colors(context).strokeSoft),
        ),
      ),
      child: Row(
        children: [
          if (prefixSvgPath != null) ...[
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors(context).strokeSoft),
              ),
              child: SvgPicture.asset(
                prefixSvgPath!,
                colorFilter: ColorFilter.mode(
                  colors(context).iconSub,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const Width(14.0)
          ],
          Expanded(
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.labelSmall
                  .copyWith(color: colors(context).textStrong),
            ),
          ),
          if (suffix != null) ...[const Width(14), suffix!]
        ],
      ),
    );
  }
}

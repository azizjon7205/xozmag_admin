import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import 'box.dart';
import 'sizes.dart';

class ItemStatus extends StatelessWidget {
  const ItemStatus({super.key, required this.typeLabel, required this.onStatusChange, required this.status});
  final String typeLabel;
  final Function(bool) onStatusChange;
  final bool status;


  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      radius: 12,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'base.status'.tr(),
                  style: AppTextStyles.labelSmall.copyWith(
                      color: colors(context).textStrong,),
                ),
                const Height(4),
                Text(
                  typeLabel,
                  style: AppTextStyles.paragraphXSmall.copyWith(
                      color: colors(context).textSub,),
                ),
              ],
            ),
          ),
          const Width(14),
          Switch(
            trackOutlineColor: WidgetStateProperty.all(colors(context).bgSoft),
            thumbColor: WidgetStateProperty.all(colors(context).white),
            inactiveTrackColor: colors(context).bgSoft,
            activeTrackColor: colors(context).primary,
            activeColor: colors(context).white,
            value: status,
            onChanged: onStatusChange,
          )
        ],
      ),
    );
  }
}

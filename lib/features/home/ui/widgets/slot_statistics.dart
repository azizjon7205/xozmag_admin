import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '../provider/home_controller.dart';

class SlotStatistics extends StatelessWidget {
  const SlotStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        spacing: 8.0,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: colors(context).strokeSoft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.0,
                children: [
                  Text(
                    'home.total_income'.tr(),
                    style: AppTextStyles.paragraphSmall
                        .copyWith(color: colors(context).textSub),
                  ),
                  Text(
                    '23 560 so\'m',
                    style: AppTextStyles.titleH5
                        .copyWith(color: colors(context).textStrong),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: colors(context).strokeSoft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.0,
                children: [
                  Text(
                    'home.orders'.tr(),
                    style: AppTextStyles.paragraphSmall
                        .copyWith(color: colors(context).textSub),
                  ),
                  Text(
                    '160 ta',
                    style: AppTextStyles.titleH5
                        .copyWith(color: colors(context).textStrong),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: colors(context).strokeSoft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.0,
                children: [
                  Text(
                    'home.net_profit'.tr(),
                    style: AppTextStyles.paragraphSmall
                        .copyWith(color: colors(context).textSub),
                  ),
                  Text(
                    '28 254 840 so\'m',
                    style: AppTextStyles.titleH5
                        .copyWith(color: colors(context).textStrong),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

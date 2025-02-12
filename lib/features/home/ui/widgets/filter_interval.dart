import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '../provider/home_controller.dart';

class FilterInterval extends StatelessWidget {
  const FilterInterval({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) => Column(
        spacing: 4.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'home.interval'.tr(),
            style: AppTextStyles.labelSmall.copyWith(
              color: colors(context).textStrong,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: colors(context).bgWeak,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              spacing: 4.0,
              children: [
                ...controller.detailTabs.map(
                      (tab) => GestureDetector(
                        onTap: () {
                          controller.onTabsChanged(tab);
                        },
                        child: Container(
                          width: 90.0,
                          padding: const EdgeInsets.all(4.0),
                          decoration: tab.id == controller.activeTabId
                              ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: colors(context).white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 4,
                                    color: const Color(0xFF0E121B)
                                        .withValues(alpha: 0.03)),
                                BoxShadow(
                                    offset: const Offset(0, 6),
                                    blurRadius: 10,
                                    color: const Color(0xFF0E121B)
                                        .withValues(alpha: 0.06)),
                              ])
                              : const BoxDecoration(color: Colors.transparent),
                          child: Center(
                            child: Text(
                              tab.label.tr(),
                              style: AppTextStyles.labelSmall.copyWith(
                                  color: tab.id == controller.activeTabId
                                      ? colors(context).textStrong
                                      : colors(context).textSoft),
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

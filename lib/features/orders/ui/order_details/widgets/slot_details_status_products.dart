import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/core/styles/app_text_styles.dart';

import '/core/styles/app_box_shadows.dart';
import '/core/styles/app_theme.dart';
import '../provider/order_details_controller.dart';
import 'content_products_list.dart';
import 'content_status_history.dart';

class SlotDetailsStatusProducts extends StatelessWidget {
  const SlotDetailsStatusProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsController>(
      builder: (context, controller, child) => Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors(context).white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: colors(context).strokeSoft),
          boxShadow: [AppBoxShadows.regularXSmall],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12.0,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: colors(context).bgWeak,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                spacing: 4.0,
                children: [
                  ...controller.detailTabs.map(
                    (tab) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.onTabsChanged(tab);
                        },
                        child: Container(
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
                  ),
                ],
              ),
            ),
            controller.activeTabId == 1
                ? const ContentStatusHistory()
                : const ContentProductsList()
          ],
        ),
      ),
    );
  }
}

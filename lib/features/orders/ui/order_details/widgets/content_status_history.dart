import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/order_status_history.dart';
import '../provider/order_details_controller.dart';
import 'item_order_status.dart';

class ContentStatusHistory extends StatelessWidget {
  const ContentStatusHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsController>(
      builder: (context, controller, child) => Column(
        spacing: 12.0,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: colors(context).strokeSoft),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        height: 6.0,
                        width: 6.0,
                        decoration: BoxDecoration(
                          color: Color(
                              int.tryParse('0xFF${'#3559E9'.substring(1)}') ??
                                  0xFFFFFFFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        'Status',
                        style: AppTextStyles.labelXSmall.copyWith(
                          color: colors(context).textSub,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/ic_sorting.svg',
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          colors(context).iconSub,
                          BlendMode.srcIn,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                AppElevatedButton(
                  label: 'base.actions.save'.tr(),
                  isEnabled: false,
                ),
                const Width(12.0),
                AppElevatedButton(
                  label: 'base.actions.cancel'.tr(),
                  isEnabled: false,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: colors(context).bgWeak,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'order.details.status.status'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'order.details.status.by_whom'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'order.details.status.date'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) => ItemOrderStatus(
              status: dummyOrderStatusHistory(),
            ),
            separatorBuilder: (context, i) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Divider(
                height: 4.0,
                indent: 1.0,
                color: colors(context).strokeSoft,
              ),
            ),
            itemCount: 4,
          )
        ],
      ),
    );
  }
}

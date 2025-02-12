import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/styles/app_theme.dart';
import '../../../../../shared/widgets/app_outlined_button.dart';
import '../../../../../shared/widgets/app_text_field.dart';
import '../../../../../shared/widgets/sizes.dart';
import '../../../../orders/domain/entities/order.dart';
import 'item_list_order.dart';

class CustomerOrdersSection extends StatelessWidget {
  const CustomerOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16.0,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: AppTextField(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8),
                  hint: 'base.search_hint'.tr(),
                  prefixIconSvgPath: 'assets/icons/ic_search.svg',
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              AppOutlinedButton(
                onPressed: () {
                  // showAdaptiveDialog(
                  //     context: context,
                  //     builder: (context) => AlertDialog(
                  //       contentPadding: EdgeInsets.zero,
                  //       backgroundColor: colors(context).bgWhite,
                  //       content: const ContentFilter(),
                  //     ));
                },
                prefix: SvgPicture.asset(
                  'assets/icons/ic_sort_desc.svg',
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                      colors(context).iconSoft, BlendMode.srcIn),
                ),
                label: 'base.actions.sort'.tr(),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colors(context).bgWeak,
                    borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'order.id'.tr(),
                          style: AppTextStyles.paragraphSmall
                              .copyWith(color: colors(context).textSub),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'order.date'.tr(),
                          style: AppTextStyles.paragraphSmall
                              .copyWith(color: colors(context).textSub),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'order.status.label'.tr(),
                          style: AppTextStyles.paragraphSmall
                              .copyWith(color: colors(context).textSub),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'order.payment.type'.tr(),
                          style: AppTextStyles.paragraphSmall
                              .copyWith(color: colors(context).textSub),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'base.actions.label'.tr(),
                          style: AppTextStyles.paragraphSmall
                              .copyWith(color: colors(context).textSub),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Height(8.0),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final order = Order(
                        id: "id$i",
                        customerNumber: '+998 99 111 22 $i$i',
                        status: 'Jarayonda',
                        paymentType: 'Naqd',
                        deliveryPrice: 1500,
                        totalPrice: 15000,
                      dateTime: DateTime.now()
                    );
                    return ItemListOrder(order: order);
                  },
                  separatorBuilder: (context, i) => const Height(8.0),
                  itemCount: 20)
            ],
          )
        ],
      ),
    );
  }
}

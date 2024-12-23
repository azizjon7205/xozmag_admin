import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/order.dart';
import '../provider/orders_controller.dart';
import '../widgets/content_filter.dart';
import '../widgets/item_list_order.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrdersController(),
      child: Scaffold(
        appBar: AppExpandedBar(
          title: 'order.title'.tr(),
          subtitle: 'order.subtitle'.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
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
                          children: [
                            Text(
                              'order.total'.tr(),
                              style: AppTextStyles.paragraphSmall
                                  .copyWith(color: colors(context).textSub),
                            ),
                            const Height(8.0),
                            Text(
                              '160 ta',
                              style: AppTextStyles.titleH5
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Width(8.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: colors(context).strokeSoft),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'order.total'.tr(),
                              style: AppTextStyles.paragraphSmall
                                  .copyWith(color: colors(context).textSub),
                            ),
                            const Height(8.0),
                            Text(
                              '160 ta',
                              style: AppTextStyles.titleH5
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Width(8.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: colors(context).strokeSoft),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'order.total'.tr(),
                              style: AppTextStyles.paragraphSmall
                                  .copyWith(color: colors(context).textSub),
                            ),
                            const Height(8.0),
                            Text(
                              '160 ta',
                              style: AppTextStyles.titleH5
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Height(32.0),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
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
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    backgroundColor: colors(context).bgWhite,
                                    content: const ContentFilter(),
                                  ));
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
                ),
              ),
              const SliverToBoxAdapter(
                child: Height(16.0),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: colors(context).bgWeak,
                            borderRadius: BorderRadius.circular(8.0)),
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
                                  'order.customer.phone'.tr(),
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
                                totalPrice: 15000);
                            return ItemListOrder(order: order);
                          },
                          separatorBuilder: (context, i) => const Height(8.0),
                          itemCount: 20)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

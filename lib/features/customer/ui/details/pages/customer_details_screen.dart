import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/customer/ui/details/widgets/customer_addresses_section.dart';
import 'package:xozmag_admin/features/customer/ui/details/widgets/customer_data_forms.dart';
import 'package:xozmag_admin/features/customer/ui/details/widgets/customer_orders_section.dart';
import 'package:xozmag_admin/shared/widgets/app_container.dart';

import '/core/styles/app_theme.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/sizes.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../provider/customer_details_controller.dart';

@RoutePage()
class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerDetailsController(),
      builder: (context, child) => Scaffold(
        appBar: AppExpandedBar(
          title: 'customer.details.title'.tr(),
          subtitle: 'customer.details.subtitle'.tr(),
          actions: [
            AppElevatedButton(
              label: 'base.actions.save'.tr(),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.0,
              children: [
                Divider(
                  color: colors(context).strokeSoft,
                ),
                const Row(
                  spacing: 16.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CustomerDataForms()),
                    Expanded(child: CustomerAddressesSection()),
                  ],
                ),
                Row(
                  spacing: 16.0,
                  children: [
                    Expanded(
                      child: AppContainer(
                        padding: const EdgeInsets.all(20.0),
                        color: colors(context).bgWhite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'customer.details.total_orders'.tr(),
                              style: AppTextStyles.paragraphSmall
                                  .copyWith(color: colors(context).textSub),
                            ),
                            const Height(8.0),
                            Text(
                              '16 ta',
                              style: AppTextStyles.titleH5
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: AppContainer(
                        color: colors(context).bgWhite,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'customer.details.total_orders'.tr(),
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
                    Expanded(
                      child: AppContainer(
                        color: colors(context).bgWhite,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'customer.details.total_orders'.tr(),
                              style: AppTextStyles.paragraphSmall
                                  .copyWith(color: colors(context).textSub),
                            ),
                            const Height(8.0),
                            Text(
                              '16 ta',
                              style: AppTextStyles.titleH5
                                  .copyWith(color: colors(context).textStrong),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomerOrdersSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

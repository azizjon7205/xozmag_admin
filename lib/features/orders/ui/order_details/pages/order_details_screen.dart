import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/customer_info.dart';
import '../../../domain/entities/payment.dart';
import '../provider/order_details_controller.dart';
import '../widgets/customer_info.dart';
import '../widgets/payment_info.dart';
import '../widgets/slot_details_status_products.dart';

@RoutePage()
class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen(
      {super.key, @QueryParam("orderId") this.orderId = ''});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderDetailsController(),
      builder: (context, child) => Scaffold(
        appBar: AppExpandedBar(
          title: 'order.details.title'.tr(args: ['343252']),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: colors(context).strokeSoft,
                ),
                const Height(16.0),
                Text(
                  '2024-06-12 | 10:45',
                  style: AppTextStyles.paragraphSmall
                      .copyWith(color: colors(context).textSub),
                ),
                const Height(4.0),
                Text(
                  'Toshkent, Chilonzor tumani, Afrosiyob koʻchasi, 2',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: colors(context).textStrong),
                ),
                const Height(20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    Expanded(
                      child: CustomerInfo(
                        customer: dummyCustomer(),
                      ),
                    ),
                    Expanded(child: PaymentInfo(payment: dummyOrderPayment())),
                  ],
                ),
                const Height(20.0),
                const SlotDetailsStatusProducts()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

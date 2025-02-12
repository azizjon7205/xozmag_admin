import 'package:flutter/material.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';
import '../../../../orders/domain/entities/order.dart';

class ItemListOrder extends StatelessWidget {
  const ItemListOrder({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  order.id.toString(),
                  style: AppTextStyles.labelSmall
                      .copyWith(color: colors(context).textStrong),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  order.dateTime?.toString() ?? '',
                  style: AppTextStyles.paragraphSmall
                      .copyWith(color: colors(context).textSub),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  order.status,
                  style: AppTextStyles.labelXSmall
                      .copyWith(color: colors(context).textSub),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  order.paymentType,
                  style: AppTextStyles.labelXSmall
                      .copyWith(color: colors(context).textSub),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0)
                    .copyWith(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      order.deliveryPrice.toString(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                    Text(
                      order.totalPrice.toString(),
                      style: AppTextStyles.labelXLarge
                          .copyWith(color: colors(context).textStrong),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Height(4.0),
        Divider(
          height: 1,
          color: colors(context).strokeSoft,
        )
      ],
    );
  }
}

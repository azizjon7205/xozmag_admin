import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '../../../domain/entities/order_product.dart';
import '../provider/order_details_controller.dart';
import 'item_order_product.dart';

class ContentProductsList extends StatelessWidget {
  const ContentProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsController>(
      builder: (context, controller, child) => Column(
        spacing: 12.0,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: colors(context).bgWeak,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'order.details.products.image'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'order.details.products.name'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'order.details.products.attribute'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'order.details.products.amount'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'order.details.products.status'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'order.details.products.price'.tr(),
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
            itemBuilder: (context, i) => ItemOrderProduct(
              product: dummyOrderProduct(),
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

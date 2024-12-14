import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/products/domain/entities/product_attribute_entity.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';

class ItemProductAttribute extends StatelessWidget {
  const ItemProductAttribute({super.key, required this.item});
  final ProductAttribute item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.name != null)
                      ...[
                        Text(
                          item.name!,
                          style: AppTextStyles.labelSmall
                              .copyWith(color: colors(context).textStrong),
                        ),
                        const Height(4.0),
                      ],
                    Text(
                      'id: ${item.id}',
                      style: AppTextStyles.paragraphXSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'product.attributes.amount_value'.tr(args: ['${item.amount}']),
                  style: AppTextStyles.paragraphSmall
                      .copyWith(color: colors(context).textSub),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  item.price.toString(),
                  style: AppTextStyles.paragraphSmall
                      .copyWith(color: colors(context).textSub),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              child: Box(
                radius: 8,
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert_outlined, color: colors(context).iconSub, size: 20,),),
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

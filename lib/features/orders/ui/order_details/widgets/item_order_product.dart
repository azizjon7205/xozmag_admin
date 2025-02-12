import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/order_product.dart';

class ItemOrderProduct extends StatelessWidget {
  const ItemOrderProduct({super.key, required this.product});

  final OrderProduct product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                product.image,
                height: 32,
                width: 32,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                // TODO: navigate to product details page
              },
              child: Text(
                product.name,
                style: AppTextStyles.labelSmall.copyWith(
                  color: colors(context).primary,
                  decoration: TextDecoration.underline,
                  decorationColor: colors(context).primary,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              product.attribute,
              style: AppTextStyles.paragraphSmall
                  .copyWith(color: colors(context).textSub),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              product.amount.toString(),
              style: AppTextStyles.paragraphSmall
                  .copyWith(color: colors(context).textSub),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                border: Border.all(color: colors(context).strokeSoft),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
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
                    product.status,
                    style: AppTextStyles.labelXSmall.copyWith(
                      color: colors(context).textSub,
                    ),
                  ),
                  const Width(2.0),
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
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${product.price} x ${product.amount}',
                style: AppTextStyles.paragraphSmall
                    .copyWith(color: colors(context).textSub),
              ),
              Text(
                product.totalPrice.toString(),
                style: AppTextStyles.labelXLarge
                    .copyWith(color: colors(context).textStrong),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

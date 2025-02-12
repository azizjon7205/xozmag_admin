import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xozmag_admin/core/helper/helper.dart';

import '/core/styles/app_box_shadows.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '../../../domain/entities/payment.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key, required this.payment});

  final Payment payment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colors(context).white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: colors(context).strokeSoft),
        boxShadow: [AppBoxShadows.regularXSmall],
      ),
      child: Column(
        spacing: 16.0,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              spacing: 8.0,
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_box_line.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    colors(context).iconStrong,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  'order.details.payment.label'.tr(),
                  style: AppTextStyles.labelMedium
                      .copyWith(color: colors(context).textStrong),
                ),
              ],
            ),
          ),
          Divider(
            color: colors(context).strokeSoft,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'order.details.payment.products'.tr(),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              Text(
                Helper.formatCurrency(payment.productsPrice),
                style: AppTextStyles.labelSmall.copyWith(
                  color: colors(context).textStrong,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'order.details.payment.delivery'
                    .tr(args: [payment.productsAmount.toString()]),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              Text(
                Helper.formatCurrency(payment.deliveryPrice),
                style: AppTextStyles.labelSmall.copyWith(
                  color: colors(context).textStrong,
                ),
              )
            ],
          ),
          if (payment.discount != null)
            ...[Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'order.details.payment.promo'.tr(),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              Text(
                payment.discount?.name ?? '',
                style: AppTextStyles.labelSmall.copyWith(
                  color: colors(context).textStrong,
                ),
              )
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'order.details.payment.discount'.tr(),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              Text(
                Helper.formatCurrency(payment.discount?.discountPrice ?? 0),
                style: AppTextStyles.labelSmall.copyWith(
                  color: colors(context).textStrong,
                ),
              )
            ],
          ),],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'order.details.payment.total'
                    .tr(args: [payment.productsAmount.toString()]),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              Text(
                Helper.formatCurrency(payment.totalPrice),
                style: AppTextStyles.labelXLarge.copyWith(
                  color: colors(context).textStrong,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '/core/styles/app_text_styles.dart';
import '../../../domain/entities/customer_info.dart';
import '/core/styles/app_box_shadows.dart';
import '/core/styles/app_theme.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({super.key, required this.customer});

  final CustomerInfoEntity customer;

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
                  'assets/icons/ic_user_line.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    colors(context).iconStrong,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  'order.details.customer'.tr(),
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
                'order.details.full_name_abbr'.tr(),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              GestureDetector(
                child: Text(
                  customer.name,
                  style: AppTextStyles.labelSmall.copyWith(
                      color: colors(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: colors(context).primary),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'order.details.phone_number'.tr(),
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub),
              ),
              GestureDetector(
                child: Text(
                  customer.phone,
                  style: AppTextStyles.labelSmall.copyWith(
                      color: colors(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: colors(context).primary),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  'order.details.address'.tr(),
                  style: AppTextStyles.paragraphXSmall
                      .copyWith(color: colors(context).textSub),
                ),
              ),
              Flexible(
                flex: 3,
                child: GestureDetector(
                  child: Text(
                    customer.address + customer.address + customer.address,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.labelSmall.copyWith(
                        color: colors(context).primary,
                        decoration: TextDecoration.underline,
                        decorationColor: colors(context).primary),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: colors(context).strokeSoft),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: YandexMap(
                    onMapCreated: (controller) {
                      controller.moveCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: Point(latitude: customer.latitude, longitude: customer.longitude),
                            zoom: 12
                          ),
                        ),
                          animation: const MapAnimation(duration: 0.5)
                      );
                    },
                    zoomGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/icons/ic_location_indicator.svg'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '../provider/customer_details_controller.dart';
import '/shared/widgets/app_container.dart';

class CustomerAddressesSection extends StatelessWidget {
  const CustomerAddressesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: colors(context).bgWhite,
      child: Column(
        spacing: 16.0,
        children: [
          Row(
            spacing: 8.0,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_location_line.svg',
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  colors(context).iconStrong,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Text(
                  'customer.details.addresses'.tr(),
                  style: AppTextStyles.labelMedium
                      .copyWith(color: colors(context).textStrong),
                ),
              ),
            ],
          ),
          Divider(
            color: colors(context).strokeSoft,
          ),
          ...context.watch<CustomerDetailsController>().addresses.map(
                (element) => AppContainer(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  shadows: const [],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(element.alias, style: AppTextStyles.labelSmall.copyWith(
                        color: colors(context).textStrong
                      ),),
                      Text(element.address, style: AppTextStyles.paragraphSmall.copyWith(
                        color: colors(context).textSub
                      ),),

                    ],
                  ),
                ),
              )
        ],
      ),
    );
  }
}

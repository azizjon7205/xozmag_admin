import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/customer_details_controller.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';

class CustomerImageSlot extends StatelessWidget {
  const CustomerImageSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerDetailsController>(
      builder: (context, controller, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.mediaModelUI?.imageProvider != null
              ? Container(
                  height: 64.0,
                  width: 64.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: controller.mediaModelUI!.imageProvider!,
                    ),
                  ),
                )
              : Container(
                  height: 64.0,
                  width: 64.0,
                  decoration: BoxDecoration(
                    color: colors(context).bgSoft,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/icons/ic_avatar.png'),
                    ),
                  ),
                  // child: Image.asset('assets/icons/ic_avatar.png'),
                ),
          const Width(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'customer.details.image_title'.tr(),
                style: AppTextStyles.labelMedium
                    .copyWith(color: colors(context).textStrong),
              ),
              const Height(4),
              Text(
                'customer.details.image_subtitle'.tr(),
                style: AppTextStyles.paragraphSmall
                    .copyWith(color: colors(context).textSub),
              ),
              const Height(12),
              Row(
                children: [
                  if (controller.mediaModelUI != null) ...[
                    OutlinedButton(
                      onPressed: () {
                        controller.deleteImage();
                      },
                      style: OutlinedButton.styleFrom(
                        overlayColor: colors(context).errorLight,
                        padding: const EdgeInsets.all(6.0),
                        side: BorderSide(color: colors(context).errorBase),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'base.actions.delete'.tr(),
                        style: AppTextStyles.labelSmall.copyWith(
                          color: colors(context).errorBase,
                        ),
                      ),
                    ),
                    const Width(12),
                  ],
                  OutlinedButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      controller.mediaModelUI != null
                          ? 'base.actions.change'.tr()
                          : 'base.actions.upload'.tr(),
                      style: AppTextStyles.labelSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

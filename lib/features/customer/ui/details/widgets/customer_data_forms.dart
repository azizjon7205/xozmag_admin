import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_container.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '../provider/customer_details_controller.dart';
import 'customer_image_slot.dart';

class CustomerDataForms extends StatelessWidget {
  const CustomerDataForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerDetailsController>(
      builder: (context, controller, child) => AppContainer(
        color: colors(context).bgWhite,
        child: Column(
          spacing: 16.0,
          children: [
            Row(
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
                  'customer.details.info'.tr(),
                  style: AppTextStyles.labelMedium
                      .copyWith(color: colors(context).textStrong),
                ),
              ],
            ),
            Divider(
              color: colors(context).strokeSoft,
            ),
            const CustomerImageSlot(),
            Divider(
              color: colors(context).strokeSoft,
            ),
            Column(
              spacing: 12.0,
              children: [
                AppTextField(
                  controller: controller.fullNameEditingController,
                  label: 'customer.details.full_name'.tr(),
                  isRequired: true,
                  hint: 'customer.details.full_name'.tr(),
                ),
                AppTextField(
                  controller: controller.phoneNumberEditingController,
                  label: 'customer.details.phone_number'.tr(),
                  isRequired: true,
                  hint: '+998 12 345 67 89',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: () {},
                      isEnabled: false,
                      label: 'base.actions.cancel'.tr(),
                    ),
                  ),
                  Expanded(
                    child: AppElevatedButton(
                      borderRadius: 8.0,
                      isEnabled: false,
                      padding: const EdgeInsets.all(8.0),
                      label: 'base.actions.save'.tr(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

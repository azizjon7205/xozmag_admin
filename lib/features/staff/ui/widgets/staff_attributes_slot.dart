import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/staff/ui/widgets/staff_role_selector.dart';

import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/item_status.dart';
import '../../../../shared/widgets/sizes.dart';
import '../provider/create_staff_controller.dart';

class StaffAttributesSlot extends StatelessWidget {
  const StaffAttributesSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateStaffController>(
      builder: (context, controller, child) => Column(
        children: [
          AppTextField(
            controller: controller.fullNameEditingController,
            label: 'staff.full_name'.tr(),
            isRequired: true,
            hint: 'staff.full_name_hint'.tr(),
          ),
          const Height(12),
          AppTextField(
            controller: controller.phoneNumberEditingController,
            label: 'staff.phone_number'.tr(),
            isRequired: true,
            hint: 'staff.phone_hint'.tr(),
          ),
          const Height(12),
          const StaffRoleSelector(),
          const Height(12),
          AppTextField(
            controller: controller.loginEditingController,
            label: 'staff.login'.tr(),
            isRequired: true,
            hint: 'staff.login'.tr(),
          ),
          const Height(12),
          AppTextField(
            controller: controller.passwordEditingController,
            label: 'staff.password'.tr(),
            isRequired: true,
            hint: 'staff.password_hint'.tr(),
            obscureText: true,
          ),
          const Height(12),
          ItemStatus(
            typeLabel: 'category.status_label'.tr(),
            status: controller.status,
            onStatusChange: controller.onStatusChange,
          )
        ],
      ),
    );
  }
}

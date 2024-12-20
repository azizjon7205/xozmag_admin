import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/staff/domain/entities/staff_role.dart';
import 'package:xozmag_admin/features/staff/ui/provider/create_staff_controller.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';

class StaffRoleSelector extends StatefulWidget {
  const StaffRoleSelector({super.key});

  @override
  State<StaffRoleSelector> createState() => _StaffRoleSelectorState();
}

class _StaffRoleSelectorState extends State<StaffRoleSelector> {

  late bool isMenuExpanded;

  @override
  void initState() {
    isMenuExpanded = false;
    super.initState();
  }

  void onMenuStateChanged(bool value) {
    setState(() {
      isMenuExpanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateStaffController>();
    return Column(
      children: [
        Row(
          children: [
            Text(
              'staff.role'.tr(),
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).textStrong,
              ),
            ),
            Text(
              ' * ',
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).primary,
              ),
            ),
          ],
        ),
        const Height(4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<StaffRole>(
            onMenuStateChange: onMenuStateChanged,
            alignment: Alignment.center,
            menuItemStyleData: const MenuItemStyleData(
                overlayColor: WidgetStateColor.transparent),
            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -8),
              maxHeight: 300,
              scrollPadding: const EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                color: colors(context).bgWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0E121B1A).withOpacity(0.1),
                    offset: const Offset(0, 16),
                    spreadRadius: -12,
                    blurRadius: 32,
                  )
                ],
              ),
            ),
            onChanged: (value) {},
            buttonStyleData: const ButtonStyleData(
              overlayColor: WidgetStateColor.transparent
            ),
            customButton: Box(
                radius: 10,
                shadows: isMenuExpanded ? [
                  const BoxShadow(
                    color: PaletteTokens.neutralAlpha16,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: colors(context).bgWhite,
                    spreadRadius: 2,
                  ),

                ] : null,
                border: isMenuExpanded ? Border.all(color: colors(context).strokeStrong) : null,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.staffRole != null
                          ? controller.staffRole!.roleName
                          : 'staff.role_hint'.tr(),
                      style: AppTextStyles.paragraphSmall.copyWith(
                        color: controller.staffRole != null
                            ? colors(context).textStrong
                            : colors(context).textSoft,
                      ),
                    ),
                    Icon(isMenuExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 20, color: colors(context).iconSub,)
                  ],
                ),
            ),
            items: controller.roles
                .map((item) => DropdownMenuItem(
              onTap: () {
                controller.selectStaffRole(item);
              },
              value: item,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: item.id == controller.staffRole?.id
                      ? colors(context).bgWeak
                      : Colors.transparent,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.roleName,
                        style: AppTextStyles.paragraphSmall.copyWith(
                          color: colors(context).textStrong,
                        ),
                      ),
                    ),
                    if (controller.staffRole?.id == item.id) ...[
                      const Width(8.0),
                      Icon(
                        Icons.check,
                        size: 20,
                        color: colors(context).iconStrong,
                      )
                    ]
                  ],
                ),
              ),
            ))
                .toList(),
          ),
        )
      ],
    );
  }
}

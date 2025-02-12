import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/router/router.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/models/menu_item.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/sizes.dart';
import '../../features/staff/domain/entities/staff.dart';
import '../../features/staff/domain/entities/staff_role.dart';
import '../../features/staff/ui/provider/staff_controller.dart';

class ItemListStaff extends StatelessWidget {
  const ItemListStaff({super.key, required this.staff});

  final Staff staff;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<StaffController>();
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: colors(context).strokeSoft),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors(context).bgWeak,
              image: DecorationImage(
                image: staff.avatar != null
                    ? NetworkImage(staff.avatar ?? '')
                    : const AssetImage('assets/icons/ic_avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Width(12.0),
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      staff.fullName,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: colors(context).textStrong,
                      ),
                    ),
                    const Height(4),
                    Text(
                      staff.phone,
                      style: AppTextStyles.paragraphXSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ],
                ),
                const Width(4.0),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: colors(context).successBase.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.call,
                    size: 20,
                    color: colors(context).successBase,
                  ),
                )
              ],
            ),
          ),
          const Width(12.0),
          DropdownButtonHideUnderline(
            child: DropdownButton2<StaffRole>(
              menuItemStyleData: const MenuItemStyleData(
                  height: 36.0, overlayColor: WidgetStateColor.transparent),
              dropdownStyleData: DropdownStyleData(
                width: 200,
                offset: const Offset(-50, -8),
                // padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: colors(context).bgWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: colors(context).strokeSoft,
                      strokeAlign: BorderSide.strokeAlignInside),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0E121B).withOpacity(0.1),
                      offset: const Offset(0, 16),
                      spreadRadius: -12,
                      blurRadius: 32,
                    )
                  ],
                ),
              ),
              isExpanded: true,
              onChanged: (value) {},
              buttonStyleData: const ButtonStyleData(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent)),
              customButton: AppOutlinedButton(
                label: staff.role.roleName,
                suffix: Icon(
                  Icons.keyboard_arrow_down,
                  color: colors(context).iconSub,
                  size: 20,
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
                            color: item.id == staff.role?.id
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
                              if (staff.role.id == item.id) ...[
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
          ),
          const Width(12.0),
          DropdownButtonHideUnderline(
            child: DropdownButton2<MenuItem>(
                menuItemStyleData: const MenuItemStyleData(
                    height: 36.0, overlayColor: WidgetStateColor.transparent),
                dropdownStyleData: DropdownStyleData(
                  width: 264,
                  offset: const Offset(-210, -8),
                  // padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: colors(context).bgWhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: colors(context).strokeSoft,
                        strokeAlign: BorderSide.strokeAlignInside),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0E121B).withOpacity(0.1),
                        offset: const Offset(0, 16),
                        spreadRadius: -12,
                        blurRadius: 32,
                      )
                    ],
                  ),
                ),
                // barrierColor: colors(context).bgSurface.withOpacity(0.1),
                isExpanded: true,
                onChanged: (value) {},
                buttonStyleData: const ButtonStyleData(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent)),
                customButton: Container(
                  height: 36,
                  width: 36,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: colors(context).strokeSoft),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: colors(context).iconStrong,
                    size: 20,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: MenuItem(label: 'product.item.edit'.tr()),
                    enabled: false,
                    child: StatefulBuilder(builder: (context, menuSetState) {
                      return InkWell(
                        onTap: () {
                          navController.maybePop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 20,
                                color: colors(context).iconSub,
                              ),
                              const Width(8.0),
                              Text(
                                'product.media.edit'.tr(),
                                style: AppTextStyles.paragraphSmall.copyWith(
                                  color: colors(context).textStrong,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  DropdownMenuItem(
                    value: MenuItem(label: 'base.actions.delete'.tr()),
                    enabled: false,
                    child: StatefulBuilder(builder: (context, menuSetState) {
                      return InkWell(
                        onTap: () {
                          navController.maybePop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.delete,
                                size: 20,
                                color: colors(context).errorBase,
                              ),
                              const Width(8.0),
                              Text(
                                'base.actions.delete'.tr(),
                                style: AppTextStyles.paragraphSmall.copyWith(
                                  color: colors(context).errorBase,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

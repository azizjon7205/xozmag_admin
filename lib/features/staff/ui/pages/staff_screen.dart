import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/staff/domain/entities/staff.dart';
import 'package:xozmag_admin/features/staff/domain/entities/staff_role.dart';
import 'package:xozmag_admin/features/staff/ui/provider/staff_controller.dart';
import 'package:xozmag_admin/features/staff/ui/widgets/create_staff_section.dart';
import 'package:xozmag_admin/shared/widgets/item_list_staff.dart';

import '../../../main_controller.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../../../../shared/widgets/app_elevated_button.dart';

@RoutePage()
class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StaffController()..loadStaffRoles(),
      child: Scaffold(
        appBar: AppExpandedBar(
          title: 'staff.title'.tr(),
          subtitle: 'staff.subtitle'.tr(),
          onDrawerOpen: () {
            context.read<MainController>().scaffoldKey.currentState?.openDrawer();
          },
          actions: [
            const Width(20),
            AppElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: colors(context).bgWhite,
                      content: const CreateStaffSection(),
                    );
                  },
                );
              },
              label: 'base.actions.add'.tr(),
            ),
          ],
          bottom: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 32).copyWith(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: AppTextField(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    hint: 'base.search_hint'.tr(),
                    prefixIconSvgPath: 'assets/icons/ic_search.svg',
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                AppOutlinedButton(
                  prefix: SvgPicture.asset(
                    'assets/icons/ic_sort_desc.svg',
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        colors(context).iconSoft, BlendMode.srcIn),
                  ),
                  suffix: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: colors(context).iconSoft,
                  ),
                  label: 'base.actions.sort'.tr(),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 16),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemListStaff(
                    staff: Staff(
                      id: "1234235",
                      fullName: 'Test #$index',
                      avatar: 'https://picsum.photos/id/1/200/300',
                      phone: '+998 99 123 34 56', role: StaffRole(roleName: "Admin", id: '$index', role: Role.admin),
                    ),
                  ),
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

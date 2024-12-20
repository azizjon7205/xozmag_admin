import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/core/router/router.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../provider/create_staff_controller.dart';
import 'create_staff_body.dart';

class CreateStaffSection extends StatelessWidget {
  const CreateStaffSection({super.key, this.category});

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.75,
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: ChangeNotifierProvider(
          create: (context) => CreateStaffController()..loadStaffRoles(),
          builder: (context, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  children: [
                    Box(
                      radius: 20,
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/ic_apps_line.svg',
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            colors(context).iconSoft, BlendMode.srcIn),
                      ),
                    ),
                    const Width(14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'staff.create_title'.tr(),
                                  style: AppTextStyles.labelSmall.copyWith(
                                      color: colors(context).textStrong),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navController.maybePop();
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: colors(context).iconSub,
                                ),
                              )
                            ],
                          ),
                          const Height(4),
                          Text(
                            'staff.create_subtitle'.tr(),
                            style: AppTextStyles.paragraphXSmall
                                .copyWith(color: colors(context).textSub),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: colors(context).strokeSoft,
              ),
              const CreateStaffBody(),
              Divider(
                height: 1,
                color: colors(context).strokeSoft,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton(
                        onPressed: () {
                          navController.maybePop();
                        },
                        label: 'base.actions.cancel'.tr(),
                      ),
                    ),
                    const Width(12),
                    Expanded(
                      child: AppElevatedButton(
                        borderRadius: 8.0,
                        isEnabled: context
                            .watch<CreateStaffController>()
                            .isReadyToSave,
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
      ),
    );
  }
}

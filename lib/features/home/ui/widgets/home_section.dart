import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/core/styles/app_text_styles.dart';
import 'package:xozmag_admin/features/home/ui/widgets/drawer_layout.dart';
import 'package:xozmag_admin/features/home/ui/widgets/home_body.dart';
import 'package:xozmag_admin/features/main_controller.dart';
import '../../../../shared/widgets/app_outlined_button.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/box.dart';

import '../provider/home_controller.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).bgWhite,
      appBar: AppBar(
        toolbarHeight: 88.0,
        automaticallyImplyLeading: false,
        surfaceTintColor: colors(context).bgWhite,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppOutlinedButton(
                onPressed: () {
                  context.read<MainController>().scaffoldKey.currentState?.openDrawer();
                },
                borderRadius: 10,
                padding: const EdgeInsets.all(10.0),
                prefix: Icon(
                  Icons.menu,
                  color: colors(context).iconStrong,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 14.0,
                children: [
                  Column(
                    spacing: 4.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User name',
                        style: AppTextStyles.labelLarge
                            .copyWith(color: colors(context).textStrong),
                      ),
                      Text(
                        'user role',
                        style: AppTextStyles.paragraphSmall
                            .copyWith(color: colors(context).textSub),
                      ),
                    ],
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors(context).bgWeak),
                    child: SvgPicture.asset(
                      'assets/icons/ic_avatar.svg',
                      height: 48,
                      width: 48,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Divider(
              height: 1,
              thickness: 1.0,
              color: colors(context).strokeSoft,
            ),
          ),
          const Expanded(child: HomeBody()),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/home/ui/provider/home_controller.dart';

import '../../../../core/helper/helper.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/styles/app_theme.dart';
import '../../../../core/styles/colors/palette_tokens.dart';
import '../../../../core/utils/strings.dart';
import '../../../../shared/widgets/box.dart';

class FilterDate extends StatefulWidget {
  const FilterDate({super.key});

  @override
  State<FilterDate> createState() => _FilterDateState();
}

class _FilterDateState extends State<FilterDate> {
  late bool isToMenuExpanded;
  late bool isFromMenuExpanded;

  @override
  void initState() {
    isToMenuExpanded = false;
    isFromMenuExpanded = false;
    super.initState();
  }

  void onToMenuStateChanged() {
    setState(() {
      isToMenuExpanded = !isToMenuExpanded;
      isFromMenuExpanded = false;
    });
  }

  void onFromMenuStateChanged() {
    setState(() {
      isFromMenuExpanded = !isFromMenuExpanded;
      isToMenuExpanded = false;
    });
    // showDatePicker(
    //   context: context,
    //   firstDate: DateTime(1950),
    //   lastDate: DateTime(2050),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) => Column(
        spacing: 4.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'home.by_date'.tr(),
            style: AppTextStyles.labelSmall.copyWith(
              color: colors(context).textStrong,
            ),
          ),
          Row(
            spacing: 4.0,
            children: [
              Box(
                onTap: onFromMenuStateChanged,
                radius: 10,
                color: colors(context).bgWhite,
                shadows: isFromMenuExpanded
                    ? [
                        const BoxShadow(
                          color: PaletteTokens.neutralAlpha16,
                          spreadRadius: 4,
                        ),
                        BoxShadow(
                          color: colors(context).bgWhite,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
                border: isFromMenuExpanded
                    ? Border.all(color: colors(context).strokeStrong)
                    : null,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.0,
                  children: [
                    Text(
                      controller.fromDate != null
                          ? Helper.dateFormat(controller.fromDate!)
                          : datePlaceHolder,
                      style: AppTextStyles.paragraphSmall.copyWith(
                          color: controller.fromDate != null
                              ? colors(context).textStrong
                              : colors(context).textSoft),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: colors(context).iconSub,
                    )
                  ],
                ),
              ),
              Box(
                onTap: onToMenuStateChanged,
                radius: 10,
                color: colors(context).bgWhite,
                shadows: isToMenuExpanded
                    ? [
                        const BoxShadow(
                          color: PaletteTokens.neutralAlpha16,
                          spreadRadius: 4,
                        ),
                        BoxShadow(
                          color: colors(context).bgWhite,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
                border: isToMenuExpanded
                    ? Border.all(color: colors(context).strokeStrong)
                    : null,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.toDate != null
                          ? Helper.dateFormat(controller.toDate!)
                          : datePlaceHolder,
                      style: AppTextStyles.paragraphSmall.copyWith(
                        color: controller.toDate != null
                            ? colors(context).textStrong
                            : colors(context).textSoft,
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: colors(context).iconSub,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

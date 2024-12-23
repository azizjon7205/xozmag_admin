import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/helper/helper.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/core/utils/strings.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../provider/orders_filter_controller.dart';

class SlotFilterDate extends StatefulWidget {
  const SlotFilterDate({
    super.key,
  });

  @override
  State<SlotFilterDate> createState() => _SlotFilterDateState();
}

class _SlotFilterDateState extends State<SlotFilterDate> {
  late bool isChecked;
  late bool isToMenuExpanded;
  late bool isFromMenuExpanded;

  @override
  void initState() {
    isChecked = false;
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
  }

  void onValueChecked(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderFilterController>(
      builder: (context, controller, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                splashRadius: 0,
                value: isChecked,
                onChanged: onValueChecked,
              ),
              Text(
                'order.filter.by_date.label'.tr(),
                style: AppTextStyles.labelSmall.copyWith(
                  color: colors(context).textStrong,
                ),
              ),
            ],
          ),
          const Height(4),
          Row(
            children: [
              Expanded(
                child: Box(
                  onTap: isChecked ? onToMenuStateChanged : null,
                  radius: 10,
                  color: isChecked
                      ? colors(context).bgWhite
                      : colors(context).bgWeak,
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
                      : !isChecked
                          ? const Border.fromBorderSide(BorderSide.none)
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
                          color: isChecked
                              ? controller.toDate != null
                                  ? colors(context).textStrong
                                  : colors(context).textSoft
                              : colors(context).textDisabled,
                        ),
                      ),
                      const Width(8.0),
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: isChecked
                            ? colors(context).iconSub
                            : colors(context).iconDisabled,
                      )
                    ],
                  ),
                ),
              ),
              const Width(4.0),
              Expanded(
                child: Box(
                  onTap: isChecked ? onFromMenuStateChanged : null,
                  radius: 10,
                  color: isChecked
                      ? colors(context).bgWhite
                      : colors(context).bgWeak,
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
                      : !isChecked
                          ? const Border.fromBorderSide(BorderSide.none)
                          : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.fromDate != null
                            ? Helper.dateFormat(controller.fromDate!)
                            : datePlaceHolder,
                        style: AppTextStyles.paragraphSmall.copyWith(
                          color: isChecked
                              ? controller.fromDate != null
                                  ? colors(context).textStrong
                                  : colors(context).textSoft
                              : colors(context).textDisabled,
                        ),
                      ),
                      const Width(8.0),
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: isChecked
                            ? colors(context).iconSub
                            : colors(context).iconDisabled,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isToMenuExpanded && isChecked) ...[
            const Height(10.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors(context).bgWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colors(context).strokeSoft),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withValues(alpha: 0.1),
                    offset: const Offset(0, 10),
                    spreadRadius: -12,
                    blurRadius: 60,
                  )
                ],
              ),
              child: CalendarDatePicker(
                key: controller.toDateKey,
                initialDate: controller.toDate,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                onDateChanged: controller.onToDateChange,
              ),
            ),
          ],
          if (isFromMenuExpanded && isChecked) ...[
            const Height(10.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors(context).bgWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colors(context).strokeSoft),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withValues(alpha: 0.1),
                    offset: const Offset(0, 10),
                    spreadRadius: -12,
                    blurRadius: 60,
                  )
                ],
              ),
              child: CalendarDatePicker(
                key: controller.fromDateKey,
                initialDate: controller.fromDate,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                onDateChanged: controller.onFromDateChange,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

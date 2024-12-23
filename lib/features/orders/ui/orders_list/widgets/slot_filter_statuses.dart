import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../provider/orders_filter_controller.dart';

class SlotFilterStatuses extends StatefulWidget {
  const SlotFilterStatuses({
    super.key,
  });

  @override
  State<SlotFilterStatuses> createState() => _SlotFilterStatusesState();
}

class _SlotFilterStatusesState extends State<SlotFilterStatuses> {
  late bool isMenuExpanded;

  @override
  void initState() {
    isMenuExpanded = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onMenuStateChanged() {
    setState(() {
      isMenuExpanded = !isMenuExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'order.filter.status.label'.tr(),
          style: AppTextStyles.labelSmall.copyWith(
            color: colors(context).textStrong,
          ),
        ),
        const Height(4),
        Box(
          onTap: onMenuStateChanged,
          radius: 10,
          shadows: isMenuExpanded
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
          border: isMenuExpanded
              ? Border.all(color: colors(context).strokeStrong)
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.watch<OrderFilterController>().statusFieldValue != null
                    ? context.read<OrderFilterController>().statusFieldValue ??
                        ''
                    : 'order.filter.status.hint'.tr(),
                style: AppTextStyles.paragraphSmall.copyWith(
                  color:
                      context.watch<OrderFilterController>().statusFieldValue !=
                              null
                          ? colors(context).textStrong
                          : colors(context).textSoft,
                ),
              ),
              Icon(
                isMenuExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 20,
                color: colors(context).iconSub,
              )
            ],
          ),
        ),
        if (isMenuExpanded) ...[
          const Height(10.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: colors(context).bgWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colors(context).strokeSoft),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0E121B1A).withValues(alpha: 0.1),
                  offset: const Offset(0, 16),
                  spreadRadius: -12,
                  blurRadius: 32,
                )
              ],
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                final status =
                    context.watch<OrderFilterController>().statuses[i];
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  value: status.checked,
                  dense: true,
                  checkboxScaleFactor: 1,
                  onChanged: (value) {
                    context
                        .read<OrderFilterController>()
                        .onChangeStatusChecked(status.id, value ?? false);
                  },
                  title: Text(
                    status.name,
                    style: AppTextStyles.paragraphSmall
                        .copyWith(color: colors(context).textStrong),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
              separatorBuilder: (context, i) => const Height(4.0),
              itemCount: context.watch<OrderFilterController>().statuses.length,
            ),
          ),
        ],
      ],
    );
  }
}

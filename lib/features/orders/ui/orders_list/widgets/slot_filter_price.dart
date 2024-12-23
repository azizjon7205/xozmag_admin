import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../provider/orders_filter_controller.dart';

class SlotFilterPrice extends StatefulWidget {
  const SlotFilterPrice({
    super.key,
  });

  @override
  State<SlotFilterPrice> createState() => _SlotFilterPriceState();
}

class _SlotFilterPriceState extends State<SlotFilterPrice> {
  late bool isChecked;
  late bool isMenuExpanded;

  @override
  void initState() {
    isChecked = false;
    isMenuExpanded = false;
    super.initState();
  }

  void onMenuStateChanged() {
    setState(() {
      isMenuExpanded = !isMenuExpanded;
    });
  }

  void onValueChecked(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              'order.filter.by_price.label'.tr(),
              style: AppTextStyles.labelSmall.copyWith(
                color: colors(context).textStrong,
              ),
            ),
          ],
        ),
        const Height(4),
        Box(
          onTap: isChecked ? onMenuStateChanged : null,
          radius: 10,
          color: isChecked ? colors(context).bgWhite : colors(context).bgWeak,
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
              : !isChecked
                  ? const Border.fromBorderSide(BorderSide.none)
                  : null,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.watch<OrderFilterController>().priceFieldValue != null
                    ? context.read<OrderFilterController>().priceFieldValue ??
                        ''
                    : 'order.filter.by_price.hint'.tr(),
                style: AppTextStyles.paragraphSmall.copyWith(
                  color: isChecked
                      ? context
                                  .watch<OrderFilterController>()
                                  .priceFieldValue !=
                              null
                          ? colors(context).textStrong
                          : colors(context).textSoft
                      : colors(context).textDisabled,
                ),
              ),
              Icon(
                isMenuExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 20,
                color: isChecked
                    ? colors(context).iconSub
                    : colors(context).iconDisabled,
              )
            ],
          ),
        ),
        if (isMenuExpanded) ...[
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
                  color: const Color(0x0E121B1A).withValues(alpha: 0.1),
                  offset: const Offset(0, 16),
                  spreadRadius: -12,
                  blurRadius: 32,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'order.filter.by_price.cheap'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textStrong),
                    ),
                  ),
                ),
                const Height(4.0),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'order.filter.by_price.expensive'.tr(),
                      style: AppTextStyles.paragraphSmall
                          .copyWith(color: colors(context).textStrong),
                    ),
                  ),
                ),
                const Height(4.0),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: context
                            .read<OrderFilterController>()
                            .fromPriceEditingController,
                        hint: 'order.filter.by_price.from'.tr(),
                      ),
                    ),
                    const Width(4.0),
                    Expanded(
                      child: AppTextField(
                        controller: context
                            .read<OrderFilterController>()
                            .toPriceEditingController,
                        hint: 'order.filter.by_price.to'.tr(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ],
    );
  }
}

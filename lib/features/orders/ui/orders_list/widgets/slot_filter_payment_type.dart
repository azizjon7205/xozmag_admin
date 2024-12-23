import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/core/styles/colors/palette_tokens.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';
import '../provider/orders_filter_controller.dart';

class SlotFilterPaymentType extends StatefulWidget {
  const SlotFilterPaymentType({
    super.key,
  });

  @override
  State<SlotFilterPaymentType> createState() => _SlotFilterPaymentTypeState();
}

class _SlotFilterPaymentTypeState extends State<SlotFilterPaymentType> {
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
      mainAxisSize: MainAxisSize.min,
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
              'order.filter.payment_type.label'.tr(),
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
                context.watch<OrderFilterController>().paymentTypeFieldValue !=
                        null
                    ? context
                            .read<OrderFilterController>()
                            .paymentTypeFieldValue ??
                        ''
                    : 'order.filter.payment_type.hint'.tr(),
                style: AppTextStyles.paragraphSmall.copyWith(
                  color: isChecked
                      ? context
                                  .watch<OrderFilterController>()
                                  .paymentTypeFieldValue !=
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
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                final type =
                    context.watch<OrderFilterController>().paymentTypes[i];
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  value: type.checked,
                  dense: true,
                  checkboxScaleFactor: 1,
                  onChanged: (value) {
                    context
                        .read<OrderFilterController>()
                        .onChangePaymentTypeChecked(type.id, value ?? false);
                  },
                  title: Text(
                    type.name,
                    style: AppTextStyles.paragraphSmall
                        .copyWith(color: colors(context).textStrong),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
              separatorBuilder: (context, i) => const Height(4.0),
              itemCount:
                  context.watch<OrderFilterController>().paymentTypes.length,
            ),
          ),
        ],
      ],
    );
  }
}

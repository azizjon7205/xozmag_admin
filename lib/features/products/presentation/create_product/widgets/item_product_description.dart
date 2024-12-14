import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/shared/widgets/app_outlined_button.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';

class ItemProductDescription extends StatelessWidget {
  const ItemProductDescription(
      {super.key,
      this.label,
      this.subLabel,
      this.isRequired = true,
      this.description,
      required this.onSetup});

  final String? label;
  final String? subLabel;
  final String? description;
  final bool isRequired;
  final VoidCallback onSetup;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors(context).strokeSoft)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors(context).strokeSoft),
                ),
                child: SvgPicture.asset(
                  'assets/icons/ic_info.svg',
                  colorFilter: ColorFilter.mode(
                    colors(context).iconSub,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Width(8.0),
              Text(
                label!,
                style: AppTextStyles.labelSmall
                    .copyWith(color: colors(context).textStrong),
              ),
              if (isRequired)
                Text(
                  '* ',
                  style: AppTextStyles.labelSmall
                      .copyWith(color: colors(context).primary),
                ),
              if (subLabel != null)
                Text(
                  subLabel!,
                  style: AppTextStyles.paragraphSmall
                      .copyWith(color: colors(context).textSub),
                ),
              const Spacer(),
              AppOutlinedButton(
                label: 'base.actions.setup'.tr(),
                prefix: Icon(
                  Icons.edit,
                  size: 20,
                  color: colors(context).iconSub,
                ),
                onPressed: onSetup,
              )
            ],
          ),
          const Height(16),
          Divider(
            height: 1,
            color: colors(context).strokeSoft,
          ),
          const Height(16),
          Text(description ?? '-------------------')
        ],
      ),
    );
  }
}

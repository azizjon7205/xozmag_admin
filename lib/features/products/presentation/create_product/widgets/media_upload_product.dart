import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/sizes.dart';
import '../provider/product_controller.dart';

class MediaUploadProduct extends StatelessWidget {
  const MediaUploadProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [4, 4],
      color: colors(context).strokeSoft,
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Icon(
              Icons.add_circle_outlined,
              size: 24,
              color: colors(context).iconSub,
            ),
            const Height(20.0),
            Text(
              'product.media.title'.tr(),
              style: AppTextStyles.labelSmall
                  .copyWith(color: colors(context).textStrong),
            ),
            const Height(6.0),
            Text(
              'product.media.subtitle'.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.paragraphXSmall
                  .copyWith(color: colors(context).textSub),
            ),
            const Height(20.0),
            AppOutlinedButton(
              label: 'base.actions.upload'.tr(),
              onPressed: () {
                context.read<ProductController>().loadFromGallery();
              },
            )
          ],
        ),
      ),
    );
  }
}

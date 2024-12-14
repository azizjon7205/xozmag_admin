import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/create_category_controller.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';

class CategoryImageSlot extends StatelessWidget {
  const CategoryImageSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateCategoryController>(
      builder: (context, controller, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.categoryImage?.imageProvider != null
              ? Container(
                  height: 64.0,
                  width: 64.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: controller.categoryImage!.imageProvider!)),
                )
              : SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SvgPicture.asset(
                      'assets/images/im_category_placeholder.svg',
                      height: 64,
                      width: 64,
                    ),
                  ),
                ),
          const Width(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'category.upload_image_title'.tr(),
                style: AppTextStyles.labelMedium
                    .copyWith(color: colors(context).textStrong),
              ),
              const Height(4),
              Text(
                'category.upload_image_subtitle'.tr(),
                style: AppTextStyles.paragraphSmall
                    .copyWith(color: colors(context).textSub),
              ),
              const Height(12),
              Row(
                children: [
                  if (controller.categoryImage != null) ...[
                    OutlinedButton(
                      onPressed: () {
                        controller.deleteImage();
                      },
                      style: OutlinedButton.styleFrom(
                          overlayColor: colors(context).errorLight,
                          padding: const EdgeInsets.all(6.0),
                          side: BorderSide(color: colors(context).errorBase),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'base.actions.delete'.tr(),
                        style: AppTextStyles.labelSmall.copyWith(
                          color: colors(context).errorBase,
                        ),
                      ),
                    ),
                    const Width(12),
                  ],
                  OutlinedButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(6.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      controller.categoryImage != null
                          ? 'base.actions.change'.tr()
                          : 'base.actions.upload'.tr(),
                      style: AppTextStyles.labelSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/core/router/router.dart';
import 'package:xozmag_admin/features/products/presentation/create_product/models/product_media_file.dart';
import 'package:xozmag_admin/features/products/presentation/create_product/provider/product_controller.dart';

import '../../../../../shared/models/menu_item.dart';
import '/core/styles/app_box_shadows.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/box.dart';
import '/shared/widgets/sizes.dart';

class MediaUploadedItem extends StatelessWidget {
  const MediaUploadedItem({super.key, required this.mediaFile});

  final MediaFileViewModel mediaFile;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductController>();
    return Container(
      padding: const EdgeInsets.all(16.0).copyWith(left: 14),
      decoration: BoxDecoration(
        border: Border.all(color: colors(context).strokeSoft),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors(context).bgWeak,
                    border: Border.all(color: colors(context).strokeSoft),
                    image: mediaFile.imageProvider != null
                        ? DecorationImage(
                            image: mediaFile.imageProvider!,
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Visibility(
                  visible: !mediaFile.isImage,
                  child: Positioned.fill(
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/ic_play_media.svg',
                        colorFilter: ColorFilter.mode(
                            colors(context).white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Width(12.0),
          Expanded(
            child: Text(
              '${mediaFile.name}.${mediaFile.extension}',
              style: AppTextStyles.labelSmall
                  .copyWith(color: colors(context).textStrong),
            ),
          ),
          Visibility(
            visible: mediaFile.isImage,
            child: GestureDetector(
              onTap: () {
                controller.setMain(mediaFile);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 12.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: controller.mainMedia?.id == mediaFile.id ? Border.all(color: colors(context).primary) : null,
                  color: colors(context).bgWeak,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: controller.mainMedia?.id == mediaFile.id ?
                      [
                        BoxShadow(
                          color: colors(context).primaryAlpha10,
                          spreadRadius: 4
                        ),
                        BoxShadow(
                          color: colors(context).white,
                          spreadRadius: 2
                        ),
                      ] : []
                ),
                child: Text(
                  'Main img',
                  style: AppTextStyles.labelSmall
                      .copyWith(color:
                  controller.mainMedia?.id == mediaFile.id ? colors(context).primary : colors(context).textSub,
                  ),
                ),
              ),
            ),
          ),
          const Width(12.0),
          DropdownButtonHideUnderline(
            child: DropdownButton2<MenuItem>(
                menuItemStyleData: const MenuItemStyleData(
                  height: 36.0,
                    overlayColor: WidgetStateColor.transparent),
                dropdownStyleData: DropdownStyleData(
                  width: 264,
                  offset: const Offset(-210, -8),
                  // padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: colors(context).bgWhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: colors(context).strokeSoft,
                        strokeAlign: BorderSide.strokeAlignInside),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0E121B).withOpacity(0.1),
                        offset: const Offset(0, 16),
                        spreadRadius: -12,
                        blurRadius: 32,
                      )
                    ],
                  ),
                ),
                // barrierColor: colors(context).bgSurface.withOpacity(0.1),
                isExpanded: true,
                onChanged: (value) {},
                buttonStyleData: const ButtonStyleData(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent)
                ),
                customButton: Container(
                  height: 36,
                  width: 36,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: colors(context).strokeSoft),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: colors(context).iconStrong,
                    size: 20,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: MenuItem(label: 'product.media.edit'.tr()),
                    enabled: false,
                    child: StatefulBuilder(builder: (context, menuSetState) {
                      return InkWell(
                        onTap: () {
                          controller.updateMedia(mediaFile.id);
                          navController.maybePop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 20,
                                color: colors(context).iconSub,
                              ),
                              const Width(8.0),
                              Text(
                                'product.media.edit'.tr(),
                                style: AppTextStyles.paragraphSmall.copyWith(
                                  color: colors(context).textStrong,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  DropdownMenuItem(
                    value: MenuItem(label: 'base.actions.delete'.tr()),
                    enabled: false,
                    child: StatefulBuilder(builder: (context, menuSetState) {
                      return InkWell(
                        onTap: () {
                          controller.deleteMedia(mediaFile.id);
                          navController.maybePop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.delete,
                                size: 20,
                                color: colors(context).errorBase,
                              ),
                              const Width(8.0),
                              Text(
                                'base.actions.delete'.tr(),
                                style: AppTextStyles.paragraphSmall.copyWith(
                                  color: colors(context).errorBase,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

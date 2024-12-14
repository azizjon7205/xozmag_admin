import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/router/router.dart';
import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/models/menu_item.dart';
import '/shared/widgets/sizes.dart';
import '/shared/widgets/spaced_row.dart';
import '../../../domain/entities/product.dart';

class ItemListProduct extends StatelessWidget {
  const ItemListProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(color: colors(context).strokeSoft),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SpacedRow(
        padding: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(12),
        spacing: 12,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors(context).bgWeak,
                border: Border.all(color: colors(context).strokeSoft)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: product.image ?? '',
                fit: BoxFit.fill,
                color: colors(context).bgWeak,
                colorBlendMode: BlendMode.multiply,
                errorWidget: (context, value, value2) => Image.asset(
                  'assets/images/im_placeholder.png',
                  color: colors(context).bgWeak,
                  colorBlendMode: BlendMode.multiply,
                ),
                // imageBuilder: (context, imageProvider) => ColorFiltered(
                //   colorFilter: ColorFilter.mode(
                //     colors(context).bgWeak,
                //     BlendMode.multiply,
                //   ),
                //   child: Image(
                //     image: imageProvider,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: colors(context).textStrong,
                  ),
                ),
                const Height(4),
                Row(
                  children: [
                    Text(
                      'id: ',
                      style: AppTextStyles.paragraphXSmall
                          .copyWith(color: colors(context).textSub),
                    ),
                    Text(
                      product.id.toString(),
                      style: AppTextStyles.paragraphXSmall
                          .copyWith(color: colors(context).textStrong),
                    ),
                    const Width(16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: colors(context).infoBase),
                      ),
                      child: Text(
                        'product.item.attr_amount'
                            .tr(args: [product.optionsCount.toString()]),
                        style: AppTextStyles.labelXSmall
                            .copyWith(color: colors(context).infoBase),
                      ),
                    ),
                    const Width(16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: colors(context).awayLighter
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 16, color: colors(context).awayBase,),
                          const Width(2.0),
                          Text(product.rating.toString(), style: AppTextStyles.labelXSmall.copyWith(
                            color: colors(context).awayBase
                          ),)
                        ],
                      ),
                    ),
                    const Width(16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: colors(context).infoBase
                      ),
                      child: Text(
                        'product.item.amount'
                            .tr(args: [product.amount.toString()]),
                        style: AppTextStyles.labelXSmall
                            .copyWith(color: colors(context).white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                    value: MenuItem(label: 'product.item.edit'.tr()),
                    enabled: false,
                    child: StatefulBuilder(builder: (context, menuSetState) {
                      return InkWell(
                        onTap: () {
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

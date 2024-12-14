import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xozmag_admin/features/products/presentation/create_product/provider/product_controller.dart';

import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';
import 'header_widget_slots.dart';
import 'media_upload_product.dart';
import 'media_uploaded_item.dart';

class ProductMediaSlot extends StatelessWidget {
  const ProductMediaSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors(context).strokeSoft),
      ),
      child: Column(
        children: [
          HeaderWidgetSlots(
            label: 'product.media.header'.tr(),
            prefixSvgPath: 'assets/icons/ic_upload_cloud.svg',
          ),
          const Height(20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const MediaUploadProduct(),
                const Height(12),
                Consumer<ProductController>(
                  builder: (context, controller, child) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) => MediaUploadedItem(mediaFile: controller.media[i],),
                    separatorBuilder: (context, i) => const Height(12.0),
                    itemCount: controller.media.length,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

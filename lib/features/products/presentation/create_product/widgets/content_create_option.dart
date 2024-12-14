import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/router/router.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_outlined_button.dart';
import '/shared/widgets/sizes.dart';
import '../provider/product_attributes_controller.dart';
import 'body_create_product_option.dart';
import 'header_widget_slots.dart';

class ContentCreateOption extends StatelessWidget {
  const ContentCreateOption({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => ProductAttributesController()..loadProductColors(),
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.75,
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidgetSlots(
                label: 'product.attributes.header'.tr(),
                prefixSvgPath: 'assets/icons/ic_apps_line.svg',
                suffix: GestureDetector(
                  onTap: () {
                    navController.maybePop();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    Icons.clear,
                    size: 20,
                    color: colors(context).iconSub,
                  ),
                ),
              ),
              const CreateProductOptionBody(),
              Divider(
                height: 1,
                color: colors(context).strokeSoft,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton(
                        label: 'base.actions.cancel'.tr(),
                        onPressed: () {
                          navController.maybePop();
                        },
                      ),
                    ),
                    const Width(12),
                    Consumer<ProductAttributesController>(
                      builder: (context, controller, child) =>  Expanded(
                        child: AppElevatedButton(
                          onPressed: () {
                            navController.maybePop(controller.addProductAttribute());
                          },
                          label: 'base.actions.add'.tr(),
                          borderRadius: 8,
                          isEnabled: controller.isFormsReady,
                        ),
                      ),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

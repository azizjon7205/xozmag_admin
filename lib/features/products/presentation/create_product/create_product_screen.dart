import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_expanded_bar.dart';
import 'provider/product_controller.dart';
import 'widgets/product_form_layout.dart';

@RoutePage()
class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductController()..loadCategories(),
      child: Scaffold(
        appBar: AppExpandedBar(
          title: 'product.page_title'.tr(),
          subtitle: 'product.page_subtitle'.tr(),
          actions: [AppElevatedButton(label: "base.actions.add".tr())],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: ProductFormLayout(),
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/translations.dart';

import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_expanded_bar.dart';
import '/shared/widgets/sizes.dart';

@RoutePage()
class ProductDescriptionEditorScreen extends StatefulWidget {
  const ProductDescriptionEditorScreen({super.key});

  @override
  State<ProductDescriptionEditorScreen> createState() =>
      _ProductDescriptionEditorScreenState();
}

class _ProductDescriptionEditorScreenState
    extends State<ProductDescriptionEditorScreen> {
  QuillController controller =
      QuillController.basic(configurations: QuillControllerConfigurations());

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppExpandedBar(
        title: 'To\'liq ma\'lumot',
        subtitle: '(Uzb)',
        actions: [AppElevatedButton(label: "base.actions.save".tr())],
      ),
      body: FlutterQuillLocalizationsWidget(
        child: Column(
          children: [
            QuillSimpleToolbar(
                controller: controller,
                configurations: QuillSimpleToolbarConfigurations(
                  showClipboardCopy: false,
                  showClipboardCut: false,
                  showCodeBlock: false,
                  showFontFamily: false,
                  showHeaderStyle: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showSearchButton: false,
                  showInlineCode: false,
                  showLink: false,
                  customButtons: [QuillToolbarCustomButtonOptions()],
                  sharedConfigurations: QuillSharedConfigurations(
                      // locale: AppLang.cyrillic.locale,
                      ),
                )),
            // configurations: QuillSimpleToolbarConfigurations(
            //   showClipboardCopy: false,
            //   showClipboardCut: false,
            //   showCodeBlock: false,
            //   showFontFamily: false,
            //   showHeaderStyle: false,
            //   showSubscript: false,
            //   showSuperscript: false,
            //   showSearchButton: false,
            //   showInlineCode: false,
            //   sharedConfigurations: QuillSharedConfigurations(
            //     // locale: AppLang.cyrillic.locale,
            //   ),
            //
            // )),
            const Height(16.0),
            Expanded(
                child: QuillEditor.basic(
              controller: controller,
              configurations: QuillEditorConfigurations(
                  customStyleBuilder: (value) {
                    print("CustomStyleAttributes: ${value}");
                    return TextStyle();
                  },
                  sharedConfigurations: QuillSharedConfigurations(
                      // locale: AppLang.cyrillic.locale,
                      )),
            )),
          ],
        ),
      ),
    );
  }
}

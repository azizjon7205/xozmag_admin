import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/item_status.dart';
import '/shared/widgets/sizes.dart';

class CategoryAttributesSlot extends StatelessWidget {
  const CategoryAttributesSlot(
      {super.key,
      required this.nameUzEditingController,
      required this.nameCyrilEditingController,
      required this.nameRuEditingController,
      required this.status,
      required this.onStatusChange});

  final TextEditingController nameUzEditingController;
  final TextEditingController nameCyrilEditingController;
  final TextEditingController nameRuEditingController;
  final bool status;
  final Function(bool) onStatusChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: nameUzEditingController,
          label: 'base.name'.tr(),
          isRequired: true,
          subLabel: 'language.uz_label'.tr(),
          hint: 'Qurilish mollari...',
        ),
        const Height(12),
        AppTextField(
          controller: nameCyrilEditingController,
          label: 'base.name'.tr(),
          isRequired: true,
          subLabel: 'language.cyril_label'.tr(),
          hint: 'Қурулиш моллари...',
        ),
        const Height(12),
        AppTextField(
          controller: nameRuEditingController,
          label: 'base.name'.tr(),
          isRequired: true,
          subLabel: 'language.ru_label'.tr(),
          hint: 'Строительные материалы...',
        ),
        const Height(12),
        ItemStatus(
          typeLabel: 'category.status_label'.tr(),
          status: status,
          onStatusChange: onStatusChange,
        )
      ],
    );
  }
}

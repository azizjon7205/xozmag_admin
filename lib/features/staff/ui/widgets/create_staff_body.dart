import 'package:flutter/material.dart';

import '/core/styles/app_theme.dart';
import '/shared/widgets/sizes.dart';
import 'staff_attributes_slot.dart';
import 'staff_image_slot.dart';

class CreateStaffBody extends StatelessWidget {
  const CreateStaffBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const StaffImageSlot(),
          const Height(12),
          Divider(
            height: 1,
            color: colors(context).strokeSoft,
          ),
          const Height(12),
          const StaffAttributesSlot()
        ],
      ),
    );
  }
}

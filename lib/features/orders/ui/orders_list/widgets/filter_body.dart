import 'package:flutter/material.dart';

import '/shared/widgets/sizes.dart';
import 'slot_filter_date.dart';
import 'slot_filter_payment_type.dart';
import 'slot_filter_price.dart';
import 'slot_filter_statuses.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SlotFilterStatuses(),
          Height(12.0),
          SlotFilterPrice(),
          Height(12.0),
          SlotFilterDate(),
          Height(12.0),
          SlotFilterPaymentType(),
          Height(12.0),
        ],
      ),
    );
  }
}

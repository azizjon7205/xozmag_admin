import 'package:flutter/material.dart';

import 'filter_date.dart';
import 'filter_interval.dart';

class SlotFilterParams extends StatelessWidget {
  const SlotFilterParams({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterDate(),
          FilterInterval()
        ],
      ),
    );
  }
}

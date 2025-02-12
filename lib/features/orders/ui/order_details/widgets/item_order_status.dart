import 'package:flutter/material.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '../../../domain/entities/order_status_history.dart';

class ItemOrderStatus extends StatelessWidget {
  const ItemOrderStatus({super.key, required this.status});

  final OrderStatusHistory status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                minWidth: 156
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              decoration: BoxDecoration(
                border: Border.all(color: colors(context).strokeSoft),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 6.0,
                    width: 6.0,
                    decoration: BoxDecoration(
                      color: Color(
                          int.tryParse('0xFF${status.color.substring(1)}') ??
                              0xFFFFFFFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    status.status,
                    style: AppTextStyles.labelXSmall.copyWith(
                      color: colors(context).textSub,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Admin',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: colors(context).textStrong,
                    ),
                  ),
                  Text(
                    status.changedBy,
                    style: AppTextStyles.paragraphSmall.copyWith(
                      color: colors(context).textSub,
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              status.date.toString(),
              style: AppTextStyles.paragraphSmall.copyWith(
                color: colors(context).textStrong,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

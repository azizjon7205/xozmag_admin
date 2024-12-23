import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/content_filter.dart';

@RoutePage()
class OrdersFilterScreen extends StatelessWidget {
  const OrdersFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentFilter(),
    );
  }
}

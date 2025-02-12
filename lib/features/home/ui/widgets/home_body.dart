import 'package:flutter/material.dart';
import 'package:xozmag_admin/features/home/ui/widgets/slot_bar_chart.dart';
import 'package:xozmag_admin/features/home/ui/widgets/slot_staff.dart';

import '/shared/widgets/sizes.dart';
import 'slot_categories.dart';
import 'slot_filter_params.dart';
import 'slot_statistics.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SlotFilterParams(),
        ),
        SliverToBoxAdapter(
          child: SlotStatistics(),
        ),
        const SliverToBoxAdapter(
          child: Height(20),
        ),
        const SliverToBoxAdapter(
          child: SlotBarChart(),
        ),
        const SliverToBoxAdapter(
          child: Height(20),
        ),
        const SliverToBoxAdapter(
          child: SlotCategories(),
        ),
        const SliverToBoxAdapter(
          child: Height(20),
        ),
        const SliverToBoxAdapter(
          child: SlotStaff(),
        ),

      ],
    );
  }
}

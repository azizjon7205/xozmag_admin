import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_box_shadows.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/styles/app_theme.dart';
import '../../../../shared/widgets/box.dart';

class SlotBarChart extends StatefulWidget {
  const SlotBarChart({super.key});

  @override
  State<SlotBarChart> createState() => _SlotBarChartState();
}

class _SlotBarChartState extends State<SlotBarChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Box(
        radius: 10.0,
        color: colors(context).bgWhite,
        padding: const EdgeInsets.all(16.0),
        shadows: [AppBoxShadows.regularXSmall],
        child: Column(
          spacing: 16.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 8.0,
              children: [
                SvgPicture.asset('assets/icons/ic_file_chart.svg'),
                Text(
                  'home.sales'.tr(),
                  style: AppTextStyles.labelMedium
                      .copyWith(color: colors(context).textStrong),
                ),
              ],
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: colors(context).strokeSoft,
            ),
            AspectRatio(
              aspectRatio: 1.6,
              child: BarChart(
                BarChartData(
                  barTouchData: barTouchData,
                  titlesData: titlesData,
                  borderData: borderData,
                  barGroups: barGroups,
                  groupsSpace: 4,
                  gridData: const FlGridData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: colors(context).textSub,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: colors(context).textSub,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget getLabels(double value, TitleMeta meta) {
    final style =
        AppTextStyles.paragraphXSmall.copyWith(color: colors(context).textSub);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 3:
        text = '100';
        break;
      case 6:
        text = '200';
        break;
      case 9:
        text = '300';
        break;
      case 12:
        text = '400';
        break;
      case 15:
        text = '500';
        break;
      case 18:
        text = '600';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 3,
            getTitlesWidget: getLabels,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                toY: 8,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                toY: 10,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                toY: 14,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                toY: 15,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                toY: 13,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                toY: 10,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                toY: 16,
                width: 48,
                borderRadius: BorderRadius.circular(8.0),
                color: colors(context).primary.withValues(alpha: 0.32))
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

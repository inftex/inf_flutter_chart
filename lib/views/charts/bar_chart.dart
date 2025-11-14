import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  final List<ChartItem> items;
  final TextStyle? xAxisLabelStyle;
  final TextStyle? yAxisLabelStyle;
  final TextStyle? dataLabelStyle;
  final bool randomBarColor;
  final Color? barColor;
  final Color? gridColor;
  final Color? axisColor;
  const BarChart(
      {super.key,
      required this.items,
      this.xAxisLabelStyle,
      this.yAxisLabelStyle,
      this.dataLabelStyle,
      this.randomBarColor = false,
      this.barColor,
      this.gridColor,
      this.axisColor});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late TooltipBehavior _tooltipBehavior;

  Color genRandomColor(int seed) {
    final random = Random(seed);
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(color: widget.axisColor),
          labelStyle: widget.xAxisLabelStyle,
          majorGridLines: MajorGridLines(color: widget.gridColor),
        ),
        primaryYAxis: NumericAxis(
          axisLine: AxisLine(color: widget.axisColor),
          labelStyle: widget.yAxisLabelStyle,
          majorGridLines: MajorGridLines(color: widget.gridColor),
        ),
        plotAreaBorderColor: widget.gridColor,
        // Chart title
        title: const ChartTitle(text: ''),
        // Enable legend
        // legend: const Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: _tooltipBehavior,
        series: <BarSeries<ChartItem, String>>[
          BarSeries<ChartItem, String>(
            dataSource: widget.items,
            xValueMapper: (ChartItem item, _) => item.xValue,
            yValueMapper: (ChartItem item, _) => item.yValue,
            color: widget.barColor,
            pointColorMapper: (ChartItem item, index) => widget.randomBarColor
                ? genRandomColor(int.tryParse('${item.yValue}') ?? 0)
                : null,
            // Enable data label
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: widget.dataLabelStyle,
            ),
          ),
        ]);
  }
}

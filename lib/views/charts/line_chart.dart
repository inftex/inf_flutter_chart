import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final List<ChartItem> items;
  final TextStyle? xAxisLabelStyle;
  final TextStyle? yAxisLabelStyle;
  final TextStyle? dataLabelStyle;
  final Color lineColor;
  const LineChart({
    super.key,
    required this.items,
    this.xAxisLabelStyle,
    this.yAxisLabelStyle,
    this.dataLabelStyle,
    this.lineColor = Colors.blue,
  });

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: widget.xAxisLabelStyle,
        ),
        primaryYAxis: NumericAxis(
          labelStyle: widget.yAxisLabelStyle,
        ),
        // Chart title
        title: const ChartTitle(text: ''),
        // Enable legend
        // legend: const Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: _tooltipBehavior,
        series: <LineSeries<ChartItem, String>>[
          LineSeries<ChartItem, String>(
            dataSource: widget.items,
            color: widget.lineColor,
            xValueMapper: (ChartItem item, _) => item.xValue,
            yValueMapper: (ChartItem item, _) => item.yValue,
            // Enable data label
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: widget.dataLabelStyle,
            ),
          )
        ]);
  }
}

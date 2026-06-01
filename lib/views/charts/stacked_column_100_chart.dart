import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedColumn100Chart extends StatefulWidget {
  final List<StackedChartItem> items;
  final List<String> seriesNames;
  final List<Color>? seriesColors;

  final TextStyle? xAxisLabelStyle;
  final TextStyle? yAxisLabelStyle;
  final TextStyle? dataLabelStyle;

  const StackedColumn100Chart({
    super.key,
    required this.items,
    required this.seriesNames,
    this.seriesColors,
    this.xAxisLabelStyle,
    this.yAxisLabelStyle,
    this.dataLabelStyle,
  });

  @override
  State<StackedColumn100Chart> createState() => _StackedColumn100ChartState();
}

class _StackedColumn100ChartState extends State<StackedColumn100Chart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      header: '',
      canShowMarker: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 1,
      tooltipBehavior: _tooltipBehavior,
      legend: const Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: widget.xAxisLabelStyle,
      ),
      primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.none,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: widget.yAxisLabelStyle,
      ),
      series: List.generate(
        widget.seriesNames.length,
        (index) => StackedColumn100Series<StackedChartItem, String>(
          name: widget.seriesNames[index],
          color: widget.seriesColors?[index],
          dataSource: widget.items,
          xValueMapper: (item, _) => item.xValue,
          yValueMapper: (item, _) =>
              index < item.values.length ? item.values[index] : 0,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: widget.dataLabelStyle,
          ),
        ),
      ),
    );
  }
}

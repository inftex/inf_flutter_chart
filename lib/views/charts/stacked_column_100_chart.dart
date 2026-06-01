import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedColumn100Chart extends StatefulWidget {
  final List<Series> series;

  final TextStyle? xAxisLabelStyle;
  final TextStyle? yAxisLabelStyle;
  final TextStyle? dataLabelStyle;

  const StackedColumn100Chart({
    super.key,
    required this.series,
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
      series: List.generate(widget.series.length, (index) {
        final e = widget.series[index];
        return StackedColumn100Series<SeriesItem, String>(
          name: e.name,
          color: e.color,
          dataSource: e.items,
          xValueMapper: (item, _) => item.xValue,
          yValueMapper: (item, _) => item.yValue,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: widget.dataLabelStyle,
          ),
        );
      }),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final List<ChartItem> items;
  const LineChart({
    super.key,
    required this.items,
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
        primaryXAxis: const CategoryAxis(),
        // Chart title
        title: const ChartTitle(text: ''),
        // Enable legend
        // legend: const Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: _tooltipBehavior,
        series: <LineSeries<ChartItem, String>>[
          LineSeries<ChartItem, String>(
              dataSource: widget.items,
              xValueMapper: (ChartItem item, _) => item.xValue,
              yValueMapper: (ChartItem item, _) => item.yValue,
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]);
  }
}

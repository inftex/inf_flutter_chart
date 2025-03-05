import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadicalGauge extends StatefulWidget {
  final double minimum;
  final double maximum;
  final List<GaugeItem> items;
  final double value;
  final double thickness;
  final double? height;
  final Widget? valueAnnotation;
  const RadicalGauge({
    super.key,
    required this.minimum,
    required this.maximum,
    required this.items,
    required this.value,
    this.thickness = 30,
    this.height,
    this.valueAnnotation,
  });

  @override
  State<RadicalGauge> createState() => _RadicalGaugeState();
}

class _RadicalGaugeState extends State<RadicalGauge> {
  double get thickness => widget.thickness;

  GaugeTextStyle get rangeLabelStyle =>
      const GaugeTextStyle(color: Colors.white, fontSize: 11);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height ?? 200,
        child: SfRadialGauge(
            // title: const GaugeTitle(
            //     text: 'Speedometer',
            //     textStyle:
            //         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            axes: <RadialAxis>[
              RadialAxis(
                  minimum: widget.minimum,
                  maximum: widget.maximum,
                  axisLineStyle: AxisLineStyle(
                    thickness: thickness, // **Thicker arc**
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                  ranges: widget.items
                      .map((e) => GaugeRange(
                            label: e.label,
                            startValue: e.startValue,
                            endValue: e.endValue,
                            color: e.color,
                            startWidth: widget.thickness,
                            endWidth: widget.thickness,
                            labelStyle: const GaugeTextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ))
                      .toList(),
                  pointers: <GaugePointer>[
                    NeedlePointer(value: widget.value)
                  ],
                  annotations: <GaugeAnnotation>[
                    if (widget.valueAnnotation != null)
                      GaugeAnnotation(
                          widget: widget.valueAnnotation!,
                          angle: 90,
                          positionFactor: 1)
                  ])
            ]));
  }
}

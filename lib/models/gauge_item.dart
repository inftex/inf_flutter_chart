import 'package:flutter/material.dart';

class GaugeItem {
  String label;
  double startValue;
  double endValue;
  Color color;

  GaugeItem({
    required this.label,
    required this.startValue,
    required this.endValue,
    required this.color,
  });
}

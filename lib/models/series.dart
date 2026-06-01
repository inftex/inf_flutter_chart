import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';

class Series {
  final String name;
  final Color? color;
  final List<SeriesItem> items;

  Series({
    required this.name,
    required this.items,
    this.color,
  });
}

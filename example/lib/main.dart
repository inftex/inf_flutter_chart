import 'package:flutter/material.dart';
import 'package:inf_flutter_chart/inf_flutter_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // barchar default
                buildBarChart(),

                // chart default
                buildLineChart(),

                // chart black mode
                buildLineChartDarkMode(),

                // gauge
                buildRadicalGauge(),

                // gauge black mode
                buildRadicalGaugeDarkMode()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildBarChart() {
    return BarChart(
      randomBarColor: true,
      items: [1, 2, 3]
          .map((e) => ChartItem(xValue: 'Cate $e', yValue: e))
          .toList(),
    );
  }

  Widget buildRadicalGaugeDarkMode() {
    return Container(
      color: Colors.black,
      child: RadicalGauge(
        minimum: 12,
        maximum: 31.5,
        value: 20,
        axisLabelStyle: TextStyle(color: Colors.white),
        valueAnnotation: Text(
          'INF',
          style: TextStyle(color: Colors.white),
        ),
        items: [
          GaugeItem(
            label: 'Underweight',
            startValue: 12,
            endValue: 18.5,
            color: Colors.orange,
          ),
          GaugeItem(
            label: 'Normal',
            startValue: 18.5,
            endValue: 25,
            color: Colors.green,
          ),
          GaugeItem(
            label: 'Overweight',
            startValue: 25,
            endValue: 31.5,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  Widget buildRadicalGauge() {
    return RadicalGauge(
      minimum: 12,
      maximum: 31.5,
      value: 20,
      valueAnnotation: Text('INF'),
      items: [
        GaugeItem(
          label: 'Underweight',
          startValue: 12,
          endValue: 18.5,
          color: Colors.orange,
        ),
        GaugeItem(
          label: 'Normal',
          startValue: 18.5,
          endValue: 25,
          color: Colors.green,
        ),
        GaugeItem(
          label: 'Overweight',
          startValue: 25,
          endValue: 31.5,
          color: Colors.red,
        )
      ],
    );
  }

  Widget buildLineChart() {
    return Container(
      height: 200,
      child: LineChart(
        items: [1, 2, 3]
            .map((e) => ChartItem(xValue: 'Cate $e', yValue: e))
            .toList(),
      ),
    );
  }

  Widget buildLineChartDarkMode() {
    return Container(
        height: 200,
        color: Colors.black,
        child: LineChart(
          xAxisLabelStyle: TextStyle(color: Colors.white),
          yAxisLabelStyle: TextStyle(color: Colors.white),
          dataLabelStyle: TextStyle(color: Colors.white),
          items: [1, 2, 3]
              .map((e) => ChartItem(xValue: 'Cate $e', yValue: e))
              .toList(),
        ));
  }
}

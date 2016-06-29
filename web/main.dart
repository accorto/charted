
import 'dart:html';

import 'package:charted/charted.dart';



main() {
  window.console.time("time");
  drawSimpleBarChart('#simple-bar-chart', false);
  window.console.timeEnd("time");
}

void drawSimpleBarChart(String selector, bool grouped) {
  var wrapper = document.querySelector(selector),
      areaHost = wrapper.querySelector('.chart-host'),
      legendHost = wrapper.querySelector('.chart-legend-host');

  var series = new ChartSeries(
      "one", grouped ? [2, 3] : [2], new BarChartRenderer()),
      config = new ChartConfig([series], [0])
        ..legend = new ChartLegend(legendHost),
      data = new ChartData(ORDINAL_DATA_COLUMNS, ORDINAL_DATA),
      state = new ChartState();

  var area = new CartesianArea(areaHost, data, config, state: state);

  createDefaultCartesianBehaviors().forEach((behavior) {
    area.addChartBehavior(behavior);
  });
  area.draw();
  //
  window.console.dir(area);
  window.console.dirxml(area);

}

/// Helper method to create default behaviors for cartesian chart demos.
List<ChartBehavior> createDefaultCartesianBehaviors() =>
    new List.from([
      new Hovercard(isMultiValue: true),
      new AxisLabelTooltip()
    ]);

/// Sample columns used by demos with quantitative dimension scale
List<ChartColumnSpec> ORDINAL_DATA_COLUMNS = <ChartColumnSpec>[
  new ChartColumnSpec(label: 'Month', type: ChartColumnSpec.TYPE_STRING),
  new ChartColumnSpec(label: 'Grains'),
  new ChartColumnSpec(label: 'Fruits'),
  new ChartColumnSpec(label: 'Vegetables')
];

/// Sample values used by demos with quantitative dimension scale
List<List> ORDINAL_DATA = const <List>[
  const ['January',   4.50,  7,  6],
  const ['February',  5.61, 16,  8],
  const ['March',     8.26, 36,  9],
  const ['April',    15.46, 63, 49],
  const ['May',      18.50, 77, 46],
  const ['June',     14.61, 60,  8],
  const ['July',      3.26,  9,  6],
  const ['August',    1.46,  9,  3],
  const ['September', 1.46, 13,  9],
  const ['October',   2.46, 29,  3],
  const ['November',  4.46, 33,  9],
  const ['December',  8.46, 19,  3]
];

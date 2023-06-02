import 'package:flutter/material.dart';

import 'custom_widget_item.dart';

class CustomWidget {
  int index;
  CwiType type;
  List<Widget> widgets;

  CustomWidget(
      {required this.index, required this.type, required this.widgets});
}

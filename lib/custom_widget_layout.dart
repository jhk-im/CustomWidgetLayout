import 'package:flutter/material.dart';

import 'custom_widget_item.dart';
import 'custom_widget.dart';

class CustomWidgetLayout extends StatefulWidget {
  const CustomWidgetLayout({Key? key, this.spacing = 16.0, this.radius = 24.0})
      : super(key: key);

  final double spacing;
  final double radius;

  @override
  State<CustomWidgetLayout> createState() => _CustomWidgetLayoutState();
}

class _CustomWidgetLayoutState extends State<CustomWidgetLayout> {
  bool isDeleteButtonVisible = false;

  List<CustomWidget> customWidgets = [
    CustomWidget(
        index: 1, type: CwiType.item1x1, widgets: [Center(child: Text("1"))]),
    CustomWidget(
      index: 2,
      type: CwiType.item1x1,
      widgets: [
        Center(child: Text("2")),
        Center(child: Text("3")),
      ],
    ),
    CustomWidget(
      index: 3,
      type: CwiType.item2x1,
      widgets: [
        Center(child: Text("4")),
      ],
    ),
    CustomWidget(
      index: 4,
      type: CwiType.item2x2,
      widgets: [
        Center(child: Text("5")),
      ],
    ),
    CustomWidget(
      index: 0,
      type: CwiType.item1x1,
      widgets: [],
    ),
  ];

  // itemType: CwiType.item2x1,
// widgets: const [Center(child: Text("4"))],

  void _commonLongPress() {
    setState(() {
      isDeleteButtonVisible = !isDeleteButtonVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print('CustomWidgetLayout - LongPress');
        _commonLongPress();
      },
      onTap: () {
        print('CustomWidgetItem Empty - Tap');
        if (isDeleteButtonVisible) _commonLongPress();
      },
      child: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(widget.spacing / 2),
          itemCount: customWidgets.length,
          itemBuilder: (context, index) {
            return CustomWidgetItem(
              listViewIndex: index,
              spacing: widget.spacing,
              radius: widget.radius,
              itemType: customWidgets[index].type,
              widgets: customWidgets[index].widgets,
              isDeleteButtonVisible: isDeleteButtonVisible,
              longPressCallback: () {
                _commonLongPress();
              },
              dragCallback: (index) {
                setState(() {
                   final widget = customWidgets[index];
                   customWidgets.removeAt(index);
                   customWidgets.insert(0, widget);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

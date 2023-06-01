import 'package:flutter/material.dart';

import 'custom_widget_item.dart';

class CustomWidgetLayout extends StatelessWidget {
  const CustomWidgetLayout({
    Key? key,
    this.spacing = 16.0,
    this.radius = 24.0
  }) : super(key: key);

  final double spacing;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print('CustomWidgetLayout - LongPress');
      },
      child: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              CustomWidgetItem(
                spacing: spacing,
                radius: radius,
                itemType: CwiType.item1x1,
                widgets: const [Center(child: Text("1"))],
              ),
              CustomWidgetItem(
                spacing: spacing,
                radius: radius,
                itemType: CwiType.item1x1,
                widgets: const [
                  Center(child: Text("2")),
                  Center(child: Text("3"))
                ],
              ),
              CustomWidgetItem(
                spacing: spacing,
                radius: radius,
                itemType: CwiType.item2x1,
                widgets: const [Center(child: Text("4"))],
              ),
              CustomWidgetItem(
                spacing: spacing,
                radius: radius,
                itemType: CwiType.item2x2,
                widgets: const [Center(child: Text("5"))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

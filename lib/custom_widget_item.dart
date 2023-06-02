import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

enum CwiType { item1x1, item2x1, item2x2 }

class CustomWidgetItem extends StatefulWidget {
  const CustomWidgetItem({
    Key? key,
    required this.spacing,
    required this.radius,
    required this.itemType,
    required this.widgets,
    required this.longPressCallback,
    required this.isDeleteButtonVisible,
  }) : super(key: key);

  final double spacing;
  final double radius;
  final CwiType itemType;
  final List<Widget> widgets;
  final Function() longPressCallback;
  final bool isDeleteButtonVisible;

  @override
  State<CustomWidgetItem> createState() => _CustomWidgetItemState();
}

class _CustomWidgetItemState extends State<CustomWidgetItem> {
  @override
  Widget build(BuildContext context) {
    final gridItemSize = [
      [2.0, 1.0, 1.0, 2.0, 1.5, 1.5], // 1 x 1
      [1.0, 2.0, 1.0, 2.0, 2.0, 1.5], // 2 x 1
      [1.0, 1.0, 1.0, 1.0, 2.0, 2.0], // 2 x 2
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.widgets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridItemSize[widget.itemType.index][0].toInt(),
        childAspectRatio: gridItemSize[widget.itemType.index][1] /
            gridItemSize[widget.itemType.index][2],
      ),
      itemBuilder: (BuildContext context, int index) {
        return LongPressDraggable(
          data: widget.widgets[index],
          childWhenDragging: Container(),
          feedback: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width /
                      gridItemSize[widget.itemType.index][0] -
                  (widget.spacing * gridItemSize[widget.itemType.index][4]),
              height: MediaQuery.of(context).size.width /
                      gridItemSize[widget.itemType.index][3] -
                  (widget.spacing * gridItemSize[widget.itemType.index][5]),
              margin: EdgeInsets.all(widget.spacing / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                color: Colors.black38,
              ),
              child: widget.widgets[index],
            ),
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(widget.spacing / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius),
                  color: Colors.blue,
                ),
                child: widget.widgets[index],
              ),
              if (widget.isDeleteButtonVisible)
                Container(
                  width: 24.0,
                  height: 24.0,
                  margin: EdgeInsets.only(
                      left: widget.spacing / 4, top: widget.spacing / 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    color: const Color(0xFFC7C6C6),
                  ),
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        print('Delete item');
                      },
                      icon: Image.asset(
                        'assets/icons/minus.png',
                        scale: 32,
                      )),
                )
            ],
          ),
        );
      },
    );
  }
}

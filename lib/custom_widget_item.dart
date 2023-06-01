import 'package:flutter/material.dart';

enum CwiType { item1x1, item2x1, item2x2 }

class CustomWidgetItem extends StatelessWidget {
  const CustomWidgetItem({
    Key? key,
    required this.spacing,
    required this.radius,
    required this.itemType,
    required this.widgets,
  }) : super(key: key);

  final double spacing;
  final double radius;
  final CwiType itemType;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    final item = [
      [1, 2, 1, 1], // 1 x 1
      [1, 1, 2, 1], // 2 x 1
      [1, 1, 1, 1], // 2 x 2
    ];
    return GestureDetector(
      onLongPress: () {
        print('CustomWidgetItem Empty - LongPress');
      },
      child: Padding(
        padding: EdgeInsets.only(top: spacing, left: spacing, right: spacing),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widgets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: item[itemType.index][1], // 행의 개수
            childAspectRatio:
                item[itemType.index][2] / item[itemType.index][3], // 가로세로 비율
            mainAxisSpacing: spacing, // 수평 padding
            crossAxisSpacing: spacing, // 수직 padding
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onLongPress: () {
                print('CustomWidgetItem - LongPress');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.blue,
                ),
                child: widgets[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

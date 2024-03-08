import "dart:developer";

import "package:flutter/material.dart";
import "package:timeline_tile/timeline_tile.dart";
import "package:branchbuddy/utils/index.dart" show hexToColor;
import "package:branchbuddy/widgets/index.dart" show TextMedium;

class CustomTimeLineTile extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onPressed;

  const CustomTimeLineTile({
    required this.title,
    required this.isActive,
    this.isFirst = false,
    this.isLast = false,
    this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 50,
        height: 50,
        indicator: SizedBox(
          width: 30,
          height: 30,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: isActive ? Theme.of(context).colorScheme.background: hexToColor("#544D46"),
            onPressed: onPressed,
          )
        ),
      ),
      beforeLineStyle: LineStyle(
        thickness: 8,
        color: hexToColor("#544D46")),
      startChild: TextMedium(text: title),
      endChild: Padding(
        padding: EdgeInsets.only(right: (isFirst || isLast) ? 0 : 525, left: 100),
      )
    );
  }
}
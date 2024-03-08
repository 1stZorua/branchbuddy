import "package:flutter/material.dart";

class Line extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const Line ({ 
    required this.height,
    required this.width,
    required this.color,
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      )
    );
  }
}
import "package:flutter/material.dart";

class TextSmall extends StatelessWidget {
  // Text
  final String text;
  // Textstyle
  final TextStyle? style;

  const TextSmall({ required this.text, this.style, super.key });

  @override
  Widget build(BuildContext context) {
    TextStyle? baseStyle = Theme.of(context).textTheme.bodySmall;
    return Text(
      text,
      style: baseStyle?.copyWith(
        color: style?.color,
        fontWeight: style?.fontWeight,
        fontSize: style?.fontSize
      )
    );
  }
}
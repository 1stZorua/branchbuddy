import "package:flutter/material.dart";

class TextMedium extends StatelessWidget {
  // Text
  final String text;
  // Textstyle
  final TextStyle? style;

  const TextMedium({ required this.text, this.style, super.key });

  @override
  Widget build(BuildContext context) {
    TextStyle? baseStyle = Theme.of(context).textTheme.bodyMedium;
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
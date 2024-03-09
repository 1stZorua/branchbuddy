import "package:flutter/material.dart";

class TextLarge extends StatelessWidget {
  // Text
  final String text;
  // Textstyle
  final TextStyle? style;

  const TextLarge({ required this.text, this.style, super.key });

  @override
  Widget build(BuildContext context) {
    TextStyle? baseStyle = Theme.of(context).textTheme.bodyLarge;
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
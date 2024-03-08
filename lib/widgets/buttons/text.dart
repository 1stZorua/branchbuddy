import "package:branchbuddy/widgets/index.dart" show TextMedium;
import "package:flutter/material.dart";

class ButtonText extends StatelessWidget {
  final String text;
  final Icon? icon;
  final VoidCallback? onPressed;

  const ButtonText({ 
    required this.text,
    this.icon,
    this.onPressed,
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          if (icon != null) icon!,
          TextMedium(text: text, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
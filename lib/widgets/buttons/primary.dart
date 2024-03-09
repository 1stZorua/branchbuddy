import "package:branchbuddy/widgets/index.dart" show TextMedium;
import "package:flutter/material.dart";

class ButtonPrimary extends StatelessWidget {
  // Text
  final String text;
  // Function executed on press
  final VoidCallback? onPressed;

  const ButtonPrimary({ 
    required this.text,
    this.onPressed,
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextMedium(text: text, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
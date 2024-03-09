import "package:flutter/material.dart";

class InputField extends StatelessWidget {
  // Placeholder
  final String placeholder;

  const InputField({ 
    required this.placeholder,
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            color: Colors.black45,
          ),
          border: InputBorder.none, 
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        style: Theme.of(context).textTheme.bodySmall
      ),
    );
  }
}
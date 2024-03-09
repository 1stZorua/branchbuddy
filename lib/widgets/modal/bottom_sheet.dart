import "package:flutter/material.dart";
import "package:branchbuddy/utils/index.dart" show hexToColor;
import "package:branchbuddy/widgets/index.dart" show TextLarge, Line;

class ModalBottomSheet extends StatelessWidget {
  // Title
  final String title;
  // Children 
  final List<Widget> children;

  const ModalBottomSheet({ 
    required this.title,
    required this.children,
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 32,
          children: [
            Line(
              width: 64,
              height: 3,
              color: hexToColor("#D9D9D9")
            ),
            TextLarge(text: title),
            ...children,
            Padding(padding: MediaQuery.of(context).viewInsets)
          ]
        )
      )
    );
  }
}
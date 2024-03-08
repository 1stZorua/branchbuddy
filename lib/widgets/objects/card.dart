import "dart:convert";
import "package:branchbuddy/models/tree.dart";
import "package:flutter/material.dart";
import "package:branchbuddy/utils/index.dart" show hexToColor;
import "package:branchbuddy/widgets/index.dart" show TextSmall;
import "package:go_router/go_router.dart";
import "package:intl/intl.dart";

class TreeCard extends StatelessWidget {
  final Tree tree;

  const TreeCard ({ 
    required this.tree,
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String json = jsonEncode(tree.toJson());
        GoRouter.of(context).pushNamed("details", pathParameters: { "tree": json });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: hexToColor("#E4E4E4"),
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      shape: BoxShape.circle
                    )
                  )
                ),
                const Positioned(
                  left: 12.5,
                  bottom: 0,
                  child: Image(
                    image: AssetImage("assets/images/oak_tree.png")
                  ),
                )
              ]
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSmall(text: tree.species, style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSmall(text: DateFormat('dd/MM/yyyy').format(tree.plantingDate))
                ]
              ),
            )
          ]
        )
      ),
    );
  }
}
import "dart:convert";
import "package:branchbuddy/models/tree.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "package:go_router/go_router.dart";
import "package:branchbuddy/widgets/index.dart" show TextMedium, TextLarge;

class DetailsScreen extends StatelessWidget {
  // Tree json parameter
  final String treeJson;

  const DetailsScreen({ 
    required this.treeJson,
    super.key 
  });

  @override
  Widget build(BuildContext context){
    // Decoded the string to valid json
    final decodedTree = jsonDecode(treeJson);
    // Convert the decoded tree to a valid tree object
    final tree = Tree.fromJson(decodedTree);

    return Stack(
      children: [
        Image(
          image: const AssetImage("assets/images/tree_sample.png"),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            title: TextLarge(text: tree.species, style: const TextStyle(fontWeight: FontWeight.w500)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
          body: Column(
            children: [
              const Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Image(
                      image: AssetImage("assets/images/oak_tree_view.png"),
                    )
                  )
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.background,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextLarge(text: "Date"),
                          TextMedium(text: DateFormat('dd/MM/yyyy').format(tree.plantingDate))
                        ],
                      ),
                      const SizedBox(height: 16), // Add spacing between the columns
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextLarge(text: "Location"),
                          TextMedium(text: tree.location.toString())
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ],
    );
  }
}
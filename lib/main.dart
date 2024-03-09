import "package:branchbuddy/models/tree.dart";
import "package:branchbuddy/providers/navigation_provider.dart";
import "package:branchbuddy/providers/tree_provider.dart";
import "package:flutter/material.dart";
import "package:hive_flutter/adapters.dart";
import 'package:provider/provider.dart';
import "package:branchbuddy/config/index.dart" show router, lightTheme;

void main() async {
  // Initializes Hive
  await Hive.initFlutter();
  // Registers tree adapter
  Hive.registerAdapter(TreeAdapter());
  // Opens Hive tree box
  await Hive.openBox<Tree>("treeBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Create navigation provider
        ChangeNotifierProvider(
          create: (context) => NavigationProvider()
        ),
        // Create tree provider
        ChangeNotifierProvider(
          create: (context) => TreeProvider()
        ),
      ],
      child: MaterialApp.router(
        title: "branchbuddy",
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      )
    );
  }
}
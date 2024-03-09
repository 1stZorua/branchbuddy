import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({ super.key });

  @override
  Widget build(BuildContext context){
    // Goes to another screen after a delay of 2 seconds
    Future.delayed(const Duration(seconds: 2))
      .then((value) => GoRouter.of(context).goNamed("auth"));
    return Stack(
      children: [
        Image(
          image: const AssetImage("assets/images/splash_sample.png"),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover
        ),
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "branchbuddy",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ],
            )
          )
        ),
      ],
    );
  }
}
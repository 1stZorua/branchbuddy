import "package:branchbuddy/providers/index.dart" show NavigationProvider;
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({ super.key });

  @override
  Widget build(BuildContext context) {
    // Icons for each route
    final iconData = [
      Icons.my_library_books_outlined,
      Icons.park_outlined,
      Icons.shield_outlined,
      Icons.account_circle_outlined
    ];

    // Text labels for each route
    final labels = [
      "Education",
      "Tracker",
      "Ranking",
      "Profile"
    ];

    // Listens to changes of the navigation provider
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image(
                image:  const AssetImage("assets/images/tree_sample_other.png"),
                height: 86,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover
              ),
            ),
            SizedBox(
              height: 86,
              child: BottomNavigationBar(
                items: List.generate(iconData.length, (index) {
                  return BottomNavigationBarItem(
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if (provider.selectedIndex == index)
                          Positioned(
                            top: 15,
                            right: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        Icon(
                          iconData[index],
                          color: Colors.black,
                        ),
                      ],
                    ),
                    label: labels[index],
                  );
                }),
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                selectedFontSize: 14,
                unselectedFontSize: 14,
                iconSize: 40,
                backgroundColor: Colors.white.withOpacity(0.75),
                currentIndex: provider.selectedIndex,
                onTap: (int index) {
                  switch (index) {
                    case 0:
                      break;
                    case 1:
                      GoRouter.of(context).goNamed("track");
                      break;
                    case 2:
                      break;
                    case 3:
                      break;
                  }
                  provider.setSelectedIndex(index: index);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
import "package:branchbuddy/providers/tree_provider.dart";
import "package:flutter/material.dart";
import "package:branchbuddy/widgets/index.dart" show TextLarge, TextMedium, BottomNavigation, ButtonText, CustomTimeLineTile, TreeCard;
import "package:go_router/go_router.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";

class TrackScreen extends StatefulWidget {
  const TrackScreen({ super.key });

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  // The selected month, defaults to the current month
  String selectedMonth = DateFormat('MMMM').format(DateTime.now());

  // Monthly tree tips
  final Map<String, dynamic> tips = {
    "January": "Prune deciduous trees to promote healthy growth in the spring.",
    "February": "Protect young trees from frost by covering them with cloth or burlap.",
    "March": "Plant native trees to support local ecosystems and wildlife.",
    "April": "Mulch around trees to conserve moisture and suppress weeds.",
    "May": "Water newly planted trees deeply to help them establish strong roots.",
    "June": "Check trees for signs of pests or diseases and take appropriate action.",
    "July": "Provide shade for trees during hot summer days to prevent heat stress.",
    "August": "Trim back overhanging branches to reduce the risk of storm damage.",
    "September": "Fertilize trees with slow-release fertilizer to support growth.",
    "October": "Enjoy the vibrant colors of autumn foliage before leaves fall.",
    "November": "Collect fallen leaves to use as mulch or compost for your trees.",
    "December": "Celebrate the holiday season by decorating a live tree that can be planted after use."
  };

  @override
  Widget build(BuildContext context){ 
    final TreeProvider treeProvider = Provider.of<TreeProvider>(context);  
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
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 50,
                        top: 120,
                        child: Column(
                          children: [
                            const TextMedium(text: "Trees Planted", style: TextStyle(fontWeight: FontWeight.w500)),
                            TextLarge(text: "${treeProvider.trees.length}", style: const TextStyle(fontSize: 30))
                          ]
                        )
                      ),
                      const Positioned(
                        left: 20,
                        top: 125,
                        child: Image(
                          image: AssetImage("assets/images/tree_group.png")
                        ),
                      ),
                      Positioned(
                        right: -100,
                        bottom: -125,
                        child: Container(
                          width: 275,
                          height: 275,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: -22.5,
                                left: -25, 
                                child: Image.asset(
                                  "assets/images/tree_single.png",
                                  width: 175, 
                                  height: 175, 
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextLarge(text: "My Trees", style: TextStyle(fontWeight: FontWeight.w600)),
                                ButtonText(
                                  onPressed: () {
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: TextLarge(text: "Tip of the month $selectedMonth:"),
                                          content: TextMedium(text: tips[selectedMonth])
                                        );
                                      }
                                    );
                                  },
                                  text: "Tip of the month",
                                  icon: const Icon(Icons.info_outline, color: Colors.black)
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(flex: 3),
                          Expanded(
                            child: ListView(
                              reverse: true,
                              padding: const EdgeInsets.only(top: 180),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(12, (index) {
                                final monthName = DateFormat('MMMM').format(DateTime.now().subtract(Duration(days: 30 * index)));
                                return CustomTimeLineTile(
                                  title: monthName,
                                  isActive: (monthName == selectedMonth),
                                  isLast: index == 0,
                                  isFirst: index == 11,
                                  onPressed: () {
                                    setState(() {
                                      selectedMonth = monthName;
                                    });
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Consumer<TreeProvider>(
                      builder: (context, provider, child) {
                        return ListView.separated(
                          reverse: true,
                          itemCount: provider.trees.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 16); 
                          },
                          itemBuilder: (context, index) {
                            final tree = provider.trees[index];
                            return TreeCard(
                              tree: tree
                            );
                          },
                        );
                      }
                    )
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => {
              GoRouter.of(context).pushNamed("create")
            },
            child: const Icon(Icons.add)
          ),
          bottomNavigationBar: const BottomNavigation(),
        ),
      ],
    );
  }
}
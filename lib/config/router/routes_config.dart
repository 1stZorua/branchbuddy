import "package:branchbuddy/screens/index.dart";
import "package:go_router/go_router.dart";

final GoRouter router = GoRouter(
  initialLocation: "/splash",
  routes: [
    // Splash route
    GoRoute(
      name: "splash",
      path: "/splash",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const SplashScreen(),
      )
    ),
    // Authentication screen
    GoRoute(
      name: "auth",
      path: "/auth",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const AuthScreen(),
      ),
    ),
    // Tree tracker route
    GoRoute(
      name: "track",
      path: "/track",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const TrackScreen(),
      )
    ),
    // Create tree route
    GoRoute(
      name: "create",
      path: "/create",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const CreateScreen()
      )
    ),
    // Tree details route
    GoRoute(
      name: "details",
      path: "/details:tree",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: DetailsScreen(treeJson: state.pathParameters["tree"] as String),
      )
    )
  ],
);
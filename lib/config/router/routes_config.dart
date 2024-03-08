import "package:branchbuddy/screens/index.dart";
import "package:go_router/go_router.dart";

final GoRouter router = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      name: "splash",
      path: "/splash",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const SplashScreen(),
      )
    ),
    GoRoute(
      name: "auth",
      path: "/auth",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const AuthScreen(),
      ),
    ),
    GoRoute(
      name: "track",
      path: "/track",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const TrackScreen(),
      )
    ),
    GoRoute(
      name: "create",
      path: "/create",
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const CreateScreen()
      )
    ),
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
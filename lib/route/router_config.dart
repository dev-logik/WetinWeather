import 'package:bloc_app/presentation/components/bottomNavigator.dart';
import 'package:bloc_app/presentation/screens/counter_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static final goRouter = GoRouter(
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => CustomTransitionPage(
                    child: CounterView(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: secondaryAnimation,
                        child: child,
                      );
                    }),
              ),
            ],
            initialLocation: '/',
          )
        ],
        builder: (context, state, navigationShell) =>
            BottomNavigator(navigationShell: navigationShell),
      )
    ],
    initialLocation: '/',
  );
}

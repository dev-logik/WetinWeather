import 'package:bloc_app/presentation/components/components.dart';
import 'package:bloc_app/presentation/screens/screens.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

mixin class GoRouterConfig {
  static const transDurationMs = 500;
  final _homeScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(milliseconds: transDurationMs),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              child: HomeScreenView(),
            ),
        routes: <RouteBase>[
          GoRoute(
            path: '/forecast_details',
            name: 'forecast details',
            builder: (_, __) => WeatherDetails(),
          ),
          GoRoute(
            path: '/air_quality_details',
            name: 'air quality details',
            builder: (_, __) => AirQualityDetails(),
          ),
        ],
      ),
    ],
    initialLocation: '/',
  );

  final _reportScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/report',
        name: 'report',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(microseconds: transDurationMs),

              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              child: ReportView(),
            ),
      ),
    ],
  );

  final _searchScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/search',
        name: 'search',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              transitionDuration: Duration(microseconds: transDurationMs),

              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              child: SearchScreen(),
            ),
      ),
    ],
  );

  final _settingScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/settings',
        name: 'settings',
        pageBuilder:
            (_, __) => CustomTransitionPage(
              transitionDuration: Duration(microseconds: transDurationMs),

              child: SettingsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
      ),
    ],
  );

  late final goRouterConfig = GoRouter(
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        branches: <StatefulShellBranch>[
          _homeScreen,
          _searchScreen,
          _reportScreen,
          _settingScreen,
        ],
        builder:
            (_, __, navigationShell) =>
                BottomNavigator(navigationShell: navigationShell),
      ),
    ],
    initialLocation: '/',
  );
}

import 'package:bloc_app/presentation/components/bottom_navigator.dart';
import 'package:bloc_app/presentation/screens/air_quality_details.dart';
import 'package:bloc_app/presentation/screens/home_view.dart';
import 'package:bloc_app/presentation/screens/orientation%20controllers/report_orientation_view.dart';
import 'package:bloc_app/presentation/screens/search.dart';
import 'package:bloc_app/presentation/screens/settings.dart';
import 'package:bloc_app/presentation/screens/weather_detail.dart';
import 'package:go_router/go_router.dart';

mixin class GoRouterConfig {
  final _homeScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, __) => HomeScreenView(),
        routes: <RouteBase>[
          GoRoute(
            path: '/forcast_details',
            name: 'forcast details',
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
        builder: (_, __) => ReportView(),
      ),
    ],
  );

  final _searchScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (_, __) => SearchScreen(),
      ),
    ],
  );

  final _settingScreen = StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (_, __) => SettingsScreen(),
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
        builder: (_, __, navigationShell) => BottomNavigator(
          navigationShell: navigationShell,
        ),
      ),
    ],
    initialLocation: '/',
  );
}

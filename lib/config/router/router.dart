
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/config/router/navigator_observer.dart';
import 'package:technical_test_flutter_sr/features/login/presentation/screens/screens.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) => router,
);

final appShellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: LoginScreen.routeName,
  debugLogDiagnostics: true,
  navigatorKey: appShellNavigatorKey,
  observers: [
    AnalyticsNavigatorObserver(),
  ],
  routes: [
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeName,
      builder: (_, __) => const LoginScreen()
    ),
  ],
);

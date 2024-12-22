
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/config/router/navigator_observer.dart';
import 'package:technical_test_flutter_sr/features/home/domain/entities/entities.dart';
import 'package:technical_test_flutter_sr/features/home/presentation/screens/screens.dart';
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
      builder: (_, __) => const HomeScreen()
    ),
    GoRoute(
      name: RegisterScreen.routeName,
      path: RegisterScreen.routeName,
      builder: (_, __) => const RegisterScreen(),
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeName,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      name: TaskDetailScreen.routeName,
      path: TaskDetailScreen.routeName,
      builder: (context, state) {
        if (state.extra is TaskEntity) {
          return TaskDetailScreen(
            task: state.extra as TaskEntity,
          );
        }
        return TaskDetailScreen(
          task: TaskEntity.empty()
        );
      },
    ),
  ],
);

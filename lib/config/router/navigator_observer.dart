import 'package:flutter/cupertino.dart';
import 'package:technical_test_flutter_sr/config/console/console_logger.dart';

class AnalyticsNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    console.log(
      'didPush - route: ${route.settings.name},'
      ' previousRoute: ${previousRoute?.settings.name}',
      name: 'NavigatorObserver',
      emoji: '🚀',
      textColor: ColorizerTextColor.green,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    console.log(
      'didPop - route: ${route.settings.name}',
      name: 'NavigatorObserver',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    console.log(
      'didRemove - route: ${route.settings.name}',
      name: 'NavigatorObserver',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    console.log(
      'didReplace - route: ${newRoute?.settings.name}',
      name: 'NavigatorObserver',
    );
  }
}

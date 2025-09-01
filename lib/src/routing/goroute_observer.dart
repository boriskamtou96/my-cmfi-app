import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class GoRouterObserver extends NavigatorObserver {
  final _log = Logger('GoRouterObserver');
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log.info('didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log.info('didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log.info('didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _log.info('didReplace: $newRoute');
  }
}

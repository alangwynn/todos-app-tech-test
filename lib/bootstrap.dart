import 'dart:async';

import 'package:flutter/widgets.dart';

/// [bootstrap] is the entry point for the micro app
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {

  runApp(await builder());
}

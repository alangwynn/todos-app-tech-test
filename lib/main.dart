import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test_flutter_sr/app.dart';
import 'package:technical_test_flutter_sr/bootstrap.dart';
import 'package:technical_test_flutter_sr/config/client/client.dart';
import 'package:technical_test_flutter_sr/config/router/router.dart';
import 'package:technical_test_flutter_sr/config/settings.dart';
import 'package:technical_test_flutter_sr/config/storage_manager/storage_manager.dart';

void main() async {

  Settings.initialize(
    settingsMap: {
      'API_URL': 'https://reqres.in',
    },
  );

  await SecureStorageManager.initialize();

  ApiHttpClient.initialize(
    connectionTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    baseUrl: Settings().apiUrl,
  );
  
  await bootstrap(() {
    return ProviderScope(
      overrides: [goRouterProvider.overrideWithValue(router)],
      child: const App(),
    );
  });
}
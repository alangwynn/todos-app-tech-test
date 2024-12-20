import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:technical_test_flutter_sr/config/router/router.dart';
import 'package:technical_test_flutter_sr/config/theme/theme_provider.dart';
import 'package:technical_test_flutter_sr/l10n/app_localizations.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme = ref.watch(themeNotifierProvider);
    final goRouter = ref.watch(goRouterProvider);

    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          title: 'Todo App',
          theme: appTheme.getTheme(),
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
          ],
          supportedLocales: const <Locale>[
            Locale('es', 'ES'),
          ],
        ),
      ),
    );
  }
}
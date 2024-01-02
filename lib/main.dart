import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/theme/provider/theme_provider.dart';
import 'package:weather_app/features/theme/provider/theme_state.dart';
import 'package:weather_app/helper/constant/route_list.dart';
import 'package:weather_app/helper/widget/navigation_shell_widget.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/', 
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, StatefulNavigationShell navigationShell) {
          return NavigationShellWidget(
            navigationShell: navigationShell,
          );
        },
        branches: RouteList.routeList),
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherThemeState weatherTheme = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: weatherTheme.getTheme(),
      routerConfig: _router,
    );
  }
}

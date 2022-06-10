import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'core/init/navigation/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  getIt.registerSingleton<AppRouter>(AppRouter());

  runApp(
    const MyApp(),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(
    const Duration(milliseconds: 500),
  );
}

final getIt = GetIt.instance;

final router = getIt<AppRouter>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff1A1A1A),
        appBarTheme: const AppBarTheme(
          color: Color(0xff000001),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff7303EB),
          secondary: Color(0xff489D89),
          tertiary: Color(0xff37294A),
          surface: Color(0xff37294A),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vn_story/routers/route_utils.dart';
import 'package:vn_story/screens/login/ui/login_screen.dart';
import 'package:vn_story/screens/not_found/ui/not_found_screen.dart';
import 'package:vn_story/screens/register/ui/register_screen.dart';
import 'package:vn_story/screens/splash/ui/splash_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: PAGES.login.screenPath,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: PAGES.splash.screenPath,
        name: PAGES.splash.screenName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: PAGES.login.screenPath,
        name: PAGES.login.screenName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: PAGES.register.screenPath,
        name: PAGES.register.screenName,
        builder: (context, state) => RegisterScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}

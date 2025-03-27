import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vn_story/routers/route_utils.dart';
import 'package:vn_story/screens/auth/login/ui/login_screen.dart';
import 'package:vn_story/screens/auth/otp/ui/otp_screen.dart';
import 'package:vn_story/screens/home/home/ui/home_screen.dart';
import 'package:vn_story/screens/not_found/ui/not_found_screen.dart';
import 'package:vn_story/screens/auth/register/ui/register_screen.dart';
import 'package:vn_story/screens/auth/splash/ui/splash_screen.dart';

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
      GoRoute(
        path: PAGES.home.screenPath,
        name: PAGES.home.screenName,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: PAGES.otpRegister.screenPath,
        name: PAGES.otpRegister.screenName,
        builder: (context, state) => OtpScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}

import 'package:flutter/material.dart';
import 'package:flutter_base/services/route/route_transition.dart';
import 'package:flutter_base/view/auth/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/view/auth/splash_screen.dart';
import 'package:flutter_base/view/main_screen.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
bool isInitialized = false;
bool isLoggedIn = false;

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: MainScreen(child: child));
      },
      routes: [
        customShellRoute(path: Routes.login, child: const LoginScreen()),
        // customShellRoute(
        //     path: Routes.resources, child: const ResourcesScreen()),
        // customShellRoute(path: Routes.training, child: const TrainingScreen()),
        // customShellRo
        //ute(path: Routes.profile, child: const ProfileScreen()),
      ],
    ),

    ///Splash
    customRoute(path: Routes.splash, child: const SplashScreen()),
  ],
  redirect: (context, state) {
    String path = state.uri.path;
    bool isAuth = path == Routes.register ||
        path == Routes.forgotPassword ||
        path == Routes.otp;
    if (!isInitialized) return Routes.splash;
    if (!isLoggedIn && !isAuth) return Routes.login;
    return null;
  },
);

GoRoute customShellRoute({required String path, required Widget child}) {
  return GoRoute(
      path: path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state) => NoTransitionPage(child: child));
}

GoRoute customRoute({required String path, required Widget child}) {
  return GoRoute(
      path: path,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => CustomTransitionPage(
          child: child,
          transitionsBuilder:
              RouteTransition(direction: TransitionDirection.left).slide));
}

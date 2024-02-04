// The route configuration.
import 'package:code_master/pages/auth_page.dart';
import 'package:code_master/pages/home_page.dart';
import 'package:code_master/pages/onboarding_page.dart';
import 'package:code_master/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/cv_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: 'auth',
            builder: (BuildContext context, GoRouterState state) {
              return const AuthPage();
            },
          ),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: 'cv',
            builder: (BuildContext context, GoRouterState state) {
              return const CVPage();
            },
          ),
        ],
      ),
    ],
  );
}

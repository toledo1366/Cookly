import 'package:cookly/modules/auth/presentation/auth_page.dart';
import 'package:cookly/modules/main_dashboard/main_dashboard_page.dart';
import 'package:cookly/modules/registration/presentation/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return AuthPage();
      },
      routes: [
        GoRoute(
          path: 'registration',
          builder: (context, state) {
            return const RegistrationPage();
          },
        )
      ]
    ),
    GoRoute(
      path: '/main_dashboard',
      builder: (context, state) => const MainDashboardPage(),
    )
  ],
);

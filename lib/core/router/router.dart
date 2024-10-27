import 'package:cookly/modules/auth/presentation/auth_page.dart';
import 'package:cookly/modules/main_dashboard/presentation/main_dashboard_page.dart';
import 'package:cookly/modules/post_details/presentation/post_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthPage();
      },
    ),
    GoRoute(
      path: '/main_dashboard',
      builder: (context, state) => const MainDashboardPage(),
    ),
    GoRoute(
      path: '/post_details',
      builder: (context, state) => const PostDetailsPage(),
    )
  ],
);

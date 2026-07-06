import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masrophy_app/core/routing/app_routes.dart';
import 'package:masrophy_app/features/home/presentation/view/home_screen.dart';
import 'package:masrophy_app/features/login/presentation/view/login_screen.dart';

class RouterGeneratedConfig {
  static GoRouter routerGeneratedConfig() {
    return GoRouter(
      initialLocation: AppRoutes.login,
      errorBuilder: (context, state) => _errorPageBuilder(context),
      routes: [
        GoRoute(
          path: AppRoutes.login,
          name: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}

Widget _errorPageBuilder(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(child: Text('An error occurred.')),
  );
}

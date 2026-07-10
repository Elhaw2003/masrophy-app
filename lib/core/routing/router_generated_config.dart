import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masrophy_app/core/routing/app_routes.dart';
import 'package:masrophy_app/features/debts/presentation/view/debts_screen.dart';
import 'package:masrophy_app/features/expenses/presentation/view/expenses_screen.dart';
import 'package:masrophy_app/features/goals/presenation/view/goals_screen.dart';
import 'package:masrophy_app/features/home/presentation/view/home_screen.dart';
import 'package:masrophy_app/features/home_app.dart';
import 'package:masrophy_app/features/income/presentation/view/widgets/income_screen.dart';
import 'package:masrophy_app/features/login/presentation/cubit/cubit/login_with_google_cubit.dart';
import 'package:masrophy_app/features/login/presentation/view/login_screen.dart';

class RouterGeneratedConfig {
  static GoRouter routerGeneratedConfig() {
    return GoRouter(
      // initialLocation: _googleAuthService.isSignedIn
      //     ? AppRoutes.home
      //     : AppRoutes.login,
      initialLocation: AppRoutes.homeApp,
      errorBuilder: (context, state) => _errorPageBuilder(context),
      routes: [
        GoRoute(
          path: AppRoutes.login,
          name: AppRoutes.login,
          builder: (context, state) => BlocProvider(
            create: (context) => LoginWithGoogleCubit(),
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (context, state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.debts,
          name: AppRoutes.debts,
          builder: (context, state) {
            return DebtsScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.goals,
          name: AppRoutes.goals,
          builder: (context, state) {
            return GoalsScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.income,
          name: AppRoutes.income,
          builder: (context, state) {
            return IncomeScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.homeApp,
          name: AppRoutes.homeApp,
          builder: (context, state) {
            return HomeApp();
          },
        ),
        GoRoute(
          path: AppRoutes.expenses,
          name: AppRoutes.expenses,
          builder: (context, state) {
            return ExpensesScreen();
          },
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

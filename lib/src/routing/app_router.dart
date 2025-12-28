import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:p/src/features/expenses/presentation/add_expense_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'add-expense',
            builder: (context, state) => const AddExpenseScreen(),
          ),
        ],
      ),
    ],
  );
}

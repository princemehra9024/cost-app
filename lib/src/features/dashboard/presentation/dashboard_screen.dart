import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:p/src/features/expenses/presentation/expenses_list.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: const ExpensesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/add-expense');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

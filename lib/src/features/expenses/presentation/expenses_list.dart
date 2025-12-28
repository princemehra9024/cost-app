import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:p/src/features/expenses/data/expenses_repository_provider.dart';
import 'package:p/src/features/expenses/domain/expense.dart';

class ExpensesList extends ConsumerWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesListStreamProvider);

    return expensesAsync.when(
      data: (expenses) {
        if (expenses.isEmpty) {
          return const Center(child: Text('No expenses yet'));
        }
        return ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            final expense = expenses[index];
            return ListTile(
              leading: CircleAvatar(
                child: Icon(_getCategoryIcon(expense.category)),
              ),
              title: Text(expense.title),
              subtitle: Text(DateFormat.yMMMd().format(expense.date)),
              trailing: Text(
                '\$${expense.amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  IconData _getCategoryIcon(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.food:
        return Icons.fastfood;
      case ExpenseCategory.transport:
        return Icons.directions_car;
      case ExpenseCategory.entertainment:
        return Icons.movie;
      case ExpenseCategory.bills:
        return Icons.receipt;
      case ExpenseCategory.shopping:
        return Icons.shopping_bag;
      case ExpenseCategory.health:
        return Icons.medical_services;
      case ExpenseCategory.education:
        return Icons.school;
      case ExpenseCategory.other:
        return Icons.category;
    }
  }
}

// Helper provider for the stream
final expensesListStreamProvider = StreamProvider.autoDispose<List<Expense>>((ref) async* {
  final repository = await ref.watch(expensesRepositoryProvider.future);
  yield* repository.watchExpenses();
});

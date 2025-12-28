import 'package:p/src/features/expenses/domain/expense.dart';

abstract class ExpensesRepository {
  Future<List<Expense>> getAllExpenses();
  Future<void> addExpense(Expense expense);
  Future<void> deleteExpense(int id);
  Stream<List<Expense>> watchExpenses();
}

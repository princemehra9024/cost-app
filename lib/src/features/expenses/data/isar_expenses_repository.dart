import 'package:isar/isar.dart';
import 'package:p/src/features/expenses/data/expenses_repository.dart';
import 'package:p/src/features/expenses/domain/expense.dart';

class IsarExpensesRepository implements ExpensesRepository {
  final Isar isar;
  IsarExpensesRepository(this.isar);

  @override
  Future<List<Expense>> getAllExpenses() async {
    return isar.expenses.where().findAll();
  }

  @override
  Future<void> addExpense(Expense expense) async {
    await isar.writeTxn(() async {
      await isar.expenses.put(expense);
    });
  }

  @override
  Future<void> deleteExpense(int id) async {
    await isar.writeTxn(() async {
      await isar.expenses.delete(id);
    });
  }

  @override
  Stream<List<Expense>> watchExpenses() {
    return isar.expenses.where().watch(fireImmediately: true);
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:p/src/features/expenses/data/expenses_repository.dart';
import 'package:p/src/features/expenses/data/isar_expenses_repository.dart';
import 'package:p/src/features/expenses/data/isar_provider.dart';

part 'expenses_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ExpensesRepository> expensesRepository(ExpensesRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return IsarExpensesRepository(isar);
}

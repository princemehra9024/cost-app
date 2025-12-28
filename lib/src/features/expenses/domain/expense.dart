import 'package:isar/isar.dart';

part 'expense.g.dart';

@collection
class Expense {
  Id id = Isar.autoIncrement;

  late String title;
  late double amount;
  late DateTime date;

  @enumerated
  late ExpenseCategory category;
}

enum ExpenseCategory {
  food,
  transport,
  entertainment,
  bills,
  shopping,
  health,
  education,
  other
}

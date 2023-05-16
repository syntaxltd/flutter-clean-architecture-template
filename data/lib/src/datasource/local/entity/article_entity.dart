import 'package:drift/drift.dart';

class Articles extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().withLength(min: 1)();
  TextColumn get imageUrl => text().withLength(max: 255)();
  TextColumn get articleUrl => text().withLength(min: 1, max: 255)();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}

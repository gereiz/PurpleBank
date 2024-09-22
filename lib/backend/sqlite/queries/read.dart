import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN SELECT USER
Future<List<SelectUserRow>> performSelectUser(
  Database database,
) {
  const query = '''
SELECT * FROM Users;
''';
  return _readQuery(database, query, (d) => SelectUserRow(d));
}

class SelectUserRow extends SqliteRow {
  SelectUserRow(super.data);

  String get user => data['user'] as String;
  String get password => data['password'] as String;
  int get id => data['id'] as int;
}

/// END SELECT USER

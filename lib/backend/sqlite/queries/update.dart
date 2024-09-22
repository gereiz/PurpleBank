import 'package:sqflite/sqflite.dart';

/// BEGIN INSERT USER
Future performInsertUser(
  Database database, {
  String? user,
  String? pass,
}) {
  final query = '''
INSERT INTO Users (user, password) VALUES ('$user', '$pass');
''';
  return database.rawQuery(query);
}

/// END INSERT USER

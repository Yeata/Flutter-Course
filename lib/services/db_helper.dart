import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'class_manager.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE students(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT,
          phone TEXT,
          className TEXT,
          department TEXT,
          gender TEXT,
          dateRegistered TEXT,
          present INTEGER
        )
      ''');
    });
  }

  Future<int> insertStudent(Student student) async {
    final dbClient = await db;
    return await dbClient.insert('students', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    final dbClient = await db;
    final res = await dbClient.query('students');
    return res.map((e) => Student.fromMap(e)).toList();
  }

  Future<int> updateStudent(Student student) async {
    final dbClient = await db;
    return await dbClient.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final dbClient = await db;
    return await dbClient.delete('students', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> toggleAttendance(int id, bool isPresent) async {
    final dbClient = await db;
    await dbClient.update('students', {'present': isPresent ? 1 : 0}, where: 'id = ?', whereArgs: [id]);
  }
}

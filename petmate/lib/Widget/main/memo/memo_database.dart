import 'package:path/path.dart';
import 'package:petmate/Widget/main/add_alarm.dart';
import 'package:petmate/Widget/main/memo/memoModel.dart';
import 'package:sqflite/sqflite.dart';

class MemoDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'memo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            content TEXT
          )''');
      },
    );
  }

  Future<int> insertMemo(Memo memo) async {
    Database db = await database;
    return await db.insert('memo', memo.toMap());
  }

  Future<List<Memo>> getMemo() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('memo');
    return List.generate(maps.length, (index) {
      return Memo(id: maps[index]['id'], content: maps[index]['content']);
    });
  }

  Future<void> updateMemo(Memo memo) async {
    Database db = await database;
    await db
        .update('memo', memo.toMap(), where: 'id = ?', whereArgs: [memo.id]);
  }

  Future<void> deletedMemo(int id) async {
    Database db = await database;
    await db.delete('memo', where: 'id = ?', whereArgs: [id]);
  }
}

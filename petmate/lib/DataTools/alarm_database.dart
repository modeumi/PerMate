import 'package:alarm/alarm.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AlarmDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'Alarm DB');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute(
        '''id $idType, title $textType, time $textType, days $textType, isVibrationOn $boolType, isSoundOn $boolType''');
  }

  // Future<void> createAlarm(Alarm alarm) async {
  //   final Alarmdb = await instance.database;

  //   await Alarmdb.insert('alarm', alarm,
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }
}

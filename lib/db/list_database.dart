import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import 'package:fitness_app/_variables.dart';
import 'package:fitness_app/model/list.dart';

class ListDatabase {
  static final ListDatabase instance = ListDatabase._init();

  static Database? _database;

  ListDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('list.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableList ( 
  ${ListFields.equipment} $textType,
  ${ListFields.weight} $integerType,
  ${ListFields.reps} $integerType,
  ${ListFields.time} $textType
  )
''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }


}
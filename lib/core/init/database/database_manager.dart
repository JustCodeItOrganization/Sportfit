import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  Database? _db;

  Future<void> init() async {
    if (_db == null) {
      print("init()");
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'demo.db');

      _db = await openDatabase(path, version: 1,
          onCreate: (_db, int version) async {
        // olusturmak istenilen table lar burda olustururlur
        await _db.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      });
    }
  }

  Future<void> insert(String table, Map<String, Object?> values) async {
    if (_db != null) {
      await _db!
          .insert(table, values, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<Map>?> get(String table) async {
    if (_db != null) {
      List<Map> maps = await _db!.query(table);
      return maps;
    }
  }
}

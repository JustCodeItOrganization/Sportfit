import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  Database? _db;

  Future<void> init() async {
    if (_db == null) {
      print("init()");
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'demo5.db');

      _db = await openDatabase(path, version: 1,
          onCreate: (_db, int version) async {
            // olusturmak istenilen table lar burda olustururlur

            // dinamik tablolar
            await _db.execute(
                "CREATE TABLE Profile (age INTEGER,gender BOOLEAN ,height REAL,weight REAL,fitnessLevel INTEGER,calorieGoal INTEGER)");
            await _db.execute(
                'CREATE TABLE personal_exercise (exercise_id INTEGER PRIMARY KEY ,time INTEGER)');
            await _db.execute(
                'CREATE TABLE kişisel_yemek (yemek_id INTEGER PRIMARY KEY,initialAmount DOUBLE,currentAmount DOUBLE)');
            // statik tablolar
            await _db.execute(
                "CREATE TABLE Exercise (id INTEGER PRIMARY KEY,name TEXT,description TEXT,met REAL ,time INTEGER ,intensity INTEGER,is_completed BOOLEAN,set_count INTEGER,video_url TEXT,image_path TEXT)");
            await _db.execute(
                "CREATE TABLE Food (id INTEGER,name TEXT,baseCalories INTEGER,protein REAL,carbohydrate REAL,fat REAL,PRIMARY KEY (id))");
            await _db.execute(
                "INSERT INTO Profile (age, gender, height, weight, fitnessLevel, calorieGoal) VALUES(0, 0, 0, 0, 1, 0)"
            );
          });
    }
  }

  Future<void> insert(String table, Map<String, Object?> values) async {
    if (_db != null) {
      print(values);
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

import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home_page_view.dart';
import 'package:flutter_application_2/view_model/home_view_model.dart';
import 'package:flutter_application_2/view_model/input_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> main() async {
  runApp(MyApp());
  // DatabaseManager? databaseManager = DatabaseManager();
  // await databaseManager.init();
  // var value = {"name": "myName", "value": 5};
  // await databaseManager.insert("Test", value);
  // await databaseManager.get("Test");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => InputViewModel())
      ],
      child: MaterialApp(
        title: 'MVVM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme:
                AppBarTheme(titleTextStyle: GoogleFonts.poppins(fontSize: 26))),
        //home: ProfileView(),
        //home: HomeView(),
        home: PageHomeView(),
      ),
    );
  }
}

class DatabaseManager {
  Database? _db;

  Future<void> init() async {
    if (_db == null) {
      print("init()");
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'demo.db');

      _db = await openDatabase(path, version: 1,
          onCreate: (_db, int version) async {
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

  Future<void> get(String table) async {
    if (_db != null) {
      List<Map> maps = await _db!.query(table);
      print(maps);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home_page_view.dart';
import 'package:flutter_application_2/view_model/home_view_model.dart';
import 'package:flutter_application_2/view_model/input_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './view/profile_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = Hive.openBox("food");
  var boxPazartesi = await Hive.openBox("exerciseBoxPazartesi");
  var boxSali = await Hive.openBox("exerciseBoxSali");
  var boxCarsamba = await Hive.openBox("exerciseBoxCarsamba");
  var boxPersembe = await Hive.openBox("exerciseBoxPersembe");
  var boxCuma = await Hive.openBox("exerciseBoxCuma");
  var boxCumartesi = await Hive.openBox("exerciseBoxCumartesi");
  var boxPazar = await Hive.openBox("exerciseBoxPazar");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => InputViewModel()),
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

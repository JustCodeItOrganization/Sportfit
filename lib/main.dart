import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home_page_view.dart';
import 'package:flutter_application_2/view_model/home_view_model.dart';
import 'package:flutter_application_2/view_model/input_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './view/profile_storage.dart';

void main() {
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

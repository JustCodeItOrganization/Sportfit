import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class Profile extends ChangeNotifier{
   double weight;
   double height;
   int age;
   int fitnessLevel;

  Profile(this.weight, this.height, this.age, this.fitnessLevel){
    weight = 0;
    height = 0;
    age = 0;
    fitnessLevel = 0;
  }

  static Future<Profile> readProfileFromStorage() async {
    return Profile(20.0, 0, 0, 1);
  }

  Profile.fromMap(Map<String, Object?> map): weight = double.parse(map['weight'].toString()),
        height = double.parse(map['height'].toString()), age = int.parse(map['age'].toString()),
        fitnessLevel = int.parse(map['fitnessLevel'].toString());

  Map<String, Object?> toMap() => {
    'weight' : weight,
    'height' : height,
    'fitnessLevel': fitnessLevel,
    'age': age,
  };
}

class ProfileStorage{

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  Future<File> writeProfileToStorage(Profile profile) async{
    String json = jsonEncode(profile);
    File file = await _localFile;
    return file.writeAsString(json);
  }

  Future<Profile> readProfileFromStorage() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      Map<String, dynamic> profileMap = jsonDecode(contents);
      Profile profile = Profile.fromMap(profileMap);
      return profile;
    } catch (e) {
      return Profile(0, 0, 0, 0);
    }
  }
}

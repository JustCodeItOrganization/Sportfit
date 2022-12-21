import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class Profile extends ChangeNotifier{
   double weight;
   double height;
   int age;
   String fitnessLevel;
   String gender;

  Profile(this.weight, this.height, this.age, this.fitnessLevel, this.gender);

  static Future<Profile> readProfileFromStorage() async {
    return Profile(20.0, 0, 0, '1', 'Erkek');
  }

  Profile.fromMap(Map<String, Object?> map): weight = double.parse(map['weight'].toString()),
        height = double.parse(map['height'].toString()), age = int.parse(map['age'].toString()),
        fitnessLevel = map['fitnessLevel'].toString(), gender = map['gender'].toString();

  Map<String, Object?> toMap() => {
    'weight' : weight,
    'height' : height,
    'fitnessLevel': fitnessLevel,
    'age': age,
    'gender': gender,
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

}

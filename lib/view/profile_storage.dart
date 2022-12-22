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
   String goal;

  Profile(this.weight, this.height, this.age, this.fitnessLevel, this.gender, this.goal);

  static Future<Profile> readProfileFromStorage() async {
    'SELECT * FROM PROFILE';
    return Profile(20.0, 0, 0, '1', 'Erkek', 'Kilo alma');
  }

  Profile.fromMap(Map<String, Object?> map): weight = double.parse(map['weight'].toString()),
        height = double.parse(map['height'].toString()), age = int.parse(map['age'].toString()),
        fitnessLevel = map['fitnessLevel'].toString(), gender = map['gender'].toString(),
        goal = map['calorieGoal'].toString();

  Map<String, Object?> toMap() => {
    'weight' : weight,
    'height' : height,
    'fitnessLevel': fitnessLevel,
    'age': age,
    'gender': gender,
    'goal': goal,
  };
}

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class Profile extends ChangeNotifier{
  late int weight;
  late int height;

  Profile(){
    weight = 0;
    height = 0;
  }

  Future<Profile> readProfileFromStorage() {
    return ProfileStorage().readProfileFromStorage();
  }

  Profile.fromJson(Map<String, dynamic> json): weight = json['weight'], height = json['height'];

  Map<String, dynamic> toJson() => {
    'weight' : weight,
    'height' : height,
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
      Profile profile = Profile.fromJson(profileMap);
      return profile;
    } catch (e) {
      return Profile();
    }
  }
}

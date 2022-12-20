import 'package:flutter_application_2/model/exercise_model.dart';
import 'package:flutter_application_2/model/food_model.dart';
import 'package:flutter_application_2/model/profile_model.dart';

class User {
  List<Food>? food;
  List<Exercise>? exercise;
  Profile? profile;

  User({this.food, this.exercise, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    if (json['food'] != null) {
      food = <Food>[];
      json['food'].forEach((v) {
        food!.add(new Food.fromJson(v));
      });
    }
    if (json['exercise'] != null) {
      exercise = <Exercise>[];
      json['exercise'].forEach((v) {
        exercise!.add(new Exercise.fromJson(v));
      });
    }
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.food != null) {
      data['food'] = this.food!.map((v) => v.toJson()).toList();
    }
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

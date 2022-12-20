class Profile {
  int? age;
  bool? gender;
  double? height;
  int? weight;
  int? fitnessLevel;
  int? calorieGoal;

  Profile(
      {this.age,
      this.gender,
      this.height,
      this.weight,
      this.fitnessLevel,
      this.calorieGoal});

  Profile.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    fitnessLevel = json['fitnessLevel'];
    calorieGoal = json['calorieGoal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['fitnessLevel'] = this.fitnessLevel;
    data['calorieGoal'] = this.calorieGoal;
    return data;
  }
}

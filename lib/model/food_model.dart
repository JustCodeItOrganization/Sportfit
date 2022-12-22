class Food {
  int? id;
  String? name;
  int? baseCalories;
  double? protein;
  double? carbohydrate;
  double? fat;
  int? initialAmount;
  int? currentAmount;

  Food(
      {this.id,
      this.name,
      this.baseCalories,
      this.protein,
      this.carbohydrate,
      this.fat,
      this.initialAmount,
      this.currentAmount});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    baseCalories = json['baseCalories'];
    protein = json['protein'];
    carbohydrate = json['carbohydrate'];
    fat = json['fat'];
    initialAmount = json['initialAmount'];
    currentAmount = json['currentAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['baseCalories'] = this.baseCalories;
    data['protein'] = this.protein;
    data['carbohydrate'] = this.carbohydrate;
    data['fat'] = this.fat;
    data['initialAmount'] = this.initialAmount;
    data['currentAmount'] = this.currentAmount;
    return data;
  }
}

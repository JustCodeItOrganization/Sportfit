class Food {
  int id;
  String name;
  String description;
  bool isAdded;
  String imagePath;
  int calorie;

  Food({
    required this.id,
    required this.name,
    required this.description,
    this.isAdded = false,
    required this.imagePath,
    required this.calorie,
  });
}

class Exercise {
  String id;
  String title;
  String description;
  bool isExpanded;
  String videoUrl;
  String imagePath;
  int metabolicEquivalent;
  int numOfSets;
  int numOfReps;
  bool isCompleted;

  Exercise({
    required this.id,
    required this.description,
    required this.title,
    required this.videoUrl,
    required this.imagePath,
    required this.metabolicEquivalent,
    required this.numOfSets,
    required this.numOfReps,
    this.isExpanded = false,
    this.isCompleted = false,
  });
}

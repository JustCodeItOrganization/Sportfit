class Exercise {
  int? id;
  String? name;
  String? description;
  int? met;
  int? time;
  int? intensity;
  bool? isCompleted;
  int? setCount;
  String? videoUrl;
  String? imagePath;

  Exercise(
      {this.id,
      this.name,
      this.description,
      this.met,
      this.time,
      this.intensity,
      this.isCompleted,
      this.setCount,
      this.videoUrl,
      this.imagePath});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    met = json['met'];
    time = json['time'];
    intensity = json['intensity'];
    isCompleted = json['isCompleted'];
    setCount = json['setCount'];
    videoUrl = json['videoUrl'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['met'] = this.met;
    data['time'] = this.time;
    data['intensity'] = this.intensity;
    data['isCompleted'] = this.isCompleted;
    data['setCount'] = this.setCount;
    data['videoUrl'] = this.videoUrl;
    data['imagePath'] = this.imagePath;
    return data;
  }
}

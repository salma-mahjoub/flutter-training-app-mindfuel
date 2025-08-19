class Habit {
  final String title;
  final String category;
  final String duration;
  final String impact;
  final String description;
  final String tip;
  final String image;

  Habit({
    required this.title,
    required this.category,
    required this.duration,
    required this.impact,
    required this.description,
    required this.tip,
    required this.image,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      title: json['title'],
      category: json['category'],
      duration: json['duration'],
      impact: json['impact'],
      description: json['description'],
      tip: json['tip'],
      image: json['image'],
    );
  }
}

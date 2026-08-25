class RecipeModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final int durationInMinutes;
  final String difficulty; // (Easy, Medium, Hard)
  final String category; // (Breakfast, Lunch, etc.)
  final List<String> ingredients;
  final List<String> instructions;

  // 1. المبرمج الأساسي (Constructor) لبناء الوجبة داخل الكود
  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.durationInMinutes,
    required this.difficulty,
    required this.category,
    required this.ingredients,
    required this.instructions,
  });

  // 2. ميثود  (fromJson): لتحويل البيانات القادمة من الـ API أو Firebase إلى Model
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      durationInMinutes: json['durationInMinutes'] ?? 0,
      difficulty: json['difficulty'] ?? 'Easy',
      category: json['category'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }
}

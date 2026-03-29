class CourseLanguageModel {
  final int id;
  final String name;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;

  CourseLanguageModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseLanguageModel.fromJson(Map<String, dynamic> json) {
    return CourseLanguageModel(
      id: json['id'],
      name: json['name'] ?? '-',
      slug: json['slug'] ?? '-',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }

  factory CourseLanguageModel.fromString(String name) {
    return CourseLanguageModel(
      id: 0,
      name: name,
      slug: '-',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

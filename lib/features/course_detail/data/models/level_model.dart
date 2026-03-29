class LevelModel {
  final int id;
  final String name;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;

  LevelModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      id: json['id'] ?? 0,
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

  factory LevelModel.fromString(String levelName) {
    return LevelModel(
      id: 0,
      name: levelName,
      slug: '-',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
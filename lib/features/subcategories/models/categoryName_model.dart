class CategoryNameModel {
  final String name;

  CategoryNameModel({
    required this.name,
  });

  factory CategoryNameModel.fromJson(Map<String, dynamic> json) {
    return CategoryNameModel(
      name: (json['name'] ?? '').toString(),
    );
  }
}
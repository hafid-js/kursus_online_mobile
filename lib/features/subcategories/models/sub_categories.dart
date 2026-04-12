class SubCategoriesModel {
  final int id;
  final String name;

  SubCategoriesModel({
    required this.id,
    required this.name,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      id: (json['id'] ?? 0) is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,

      name: (json['name'] ?? '').toString(),
    );
  }
}
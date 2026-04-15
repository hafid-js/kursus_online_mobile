class PopularInstructorModel {
  final int id;
  final String name;
  final String image;
  final String headline;
  final int coursesCount;
  final int studentsCount;

  PopularInstructorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.headline,
    required this.coursesCount,
    required this.studentsCount,
  });

  factory PopularInstructorModel.fromJson(Map<String, dynamic> json) {
    return PopularInstructorModel(
      id: (json['id'] ?? 0) is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,

      name: (json['name'] ?? '').toString(),
      image: (json['image'] ?? '').toString(),

      headline: (json['headline'] ?? '-').toString(),

      coursesCount: (json['courses_count'] ?? 0) is int
          ? json['courses_count']
          : int.tryParse(json['courses_count'].toString()) ?? 0,

      studentsCount: (json['students_count'] ?? 0) is int
          ? json['students_count']
          : int.tryParse(json['students_count'].toString()) ?? 0,
    );
  }
}
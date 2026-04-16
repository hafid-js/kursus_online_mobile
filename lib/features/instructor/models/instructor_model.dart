class InstructorModel {
  final int id;
  final String name;
  final String image;
  final String headline;
  final String bio;
  final int coursesCount;
  final int reviewsCount;
  final int studentsCount;

  InstructorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.headline,
    required this.bio,
    required this.coursesCount,
    required this.reviewsCount,
    required this.studentsCount,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      id: (json['id'] ?? 0) is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,

      name: (json['name'] ?? '').toString(),
      image: (json['image'] ?? '').toString(),

      headline: (json['headline'] ?? '-').toString(),

      bio: (json['bio'] ?? '-').toString(),

      coursesCount: (json['courses_count'] ?? 0) is int
          ? json['courses_count']
          : int.tryParse(json['courses_count'].toString()) ?? 0,

      reviewsCount: (json['reviews_count'] ?? 0) is int
          ? json['reviews_count']
          : int.tryParse(json['reviews_count'].toString()) ?? 0,

      studentsCount: (json['students_count'] ?? 0) is int
          ? json['students_count']
          : int.tryParse(json['students_count'].toString()) ?? 0,
    );
  }
}

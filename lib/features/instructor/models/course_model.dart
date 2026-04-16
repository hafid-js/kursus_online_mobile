class CourseModel {
  final int id;
  final String title;
  final String thumbnail;
  final String headline;
  final int price;
  final String? instructorName;
  final int reviewCount;

  CourseModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.headline,
    required this.price,
    this.instructorName,
    required this.reviewCount,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      headline: json['headline'] ?? '',
      price: (json['price'] ?? 0) as int,

      instructorName: json['instructor_name'],

      reviewCount: (json['review_count'] ?? 0) is int
          ? json['review_count']
          : int.tryParse(json['review_count'].toString()) ?? 0,
    );
  }
}
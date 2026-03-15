class EnrollmentModel {
  final int id;
  final int userId;
  final int courseId;
  final bool haveAccess;

  EnrollmentModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.haveAccess,
  });

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    return EnrollmentModel(
      id: json["id"],
      userId: json["user_id"],
      courseId: json["course_id"],
      haveAccess: json["have_access"] == 1,
    );
  }
}

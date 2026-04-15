class ApiEndpoints {
  static const baseUrl = "http://127.0.0.1:8000/api/v1";

  static const enrolledCourses = "/student/enrolled-courses";

  static const mediaUrl = "http://127.0.0.1:8000";

  static const cart = "/cart";
  static String courseDetail(String slug) => "/courses/$slug";

  static String getByCategory(int parentId) => "/courses/categories/$parentId";

  static const categories = "/categories";
}

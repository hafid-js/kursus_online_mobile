import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/course_model.dart';

class CartModel {
  final int id;
  final CourseDetailModel courseDetail;

  CartModel({
    required this.id,
    required this.courseDetail
  });


  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      courseDetail: CourseDetailModel.fromJson(json['course'])
    );
  }
}
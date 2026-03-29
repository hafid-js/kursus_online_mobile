import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/review_model.dart';

class InstructorModel {
  final int id;
  final String name;
  final String image;
  final String bio;
  final List<ReviewModel> reviewCount;

  InstructorModel({required this.id, required this.name, required this.image, required this.bio, required this.reviewCount});

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
  List<ReviewModel> allReviews = [];
  if (json['courses'] != null) {
    for (var course in json['courses']) {
      if (course['reviews'] != null) {
        allReviews.addAll(
          List<ReviewModel>.from(
            course['reviews'].map((r) => ReviewModel.fromJson(r)),
          ),
        );
      }
    }
  }

  return InstructorModel(
    id: json['id'],
    name: json['name'],
    image: json['image'] ?? '',
    bio: json['bio'] ?? '',
    reviewCount: allReviews,
  );
}
  }
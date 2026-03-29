import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/review_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/user_model.dart';

class UReviewCard extends StatelessWidget {
  final ReviewModel review;
  final UserModel? user;

  const UReviewCard({super.key, required this.review, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user!.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [

                      Row(
                        children: List.generate(
                          5,
                          (i) => Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: i < (review.rating)
                                ? Colors.yellow[700]
                                : Colors.grey,
                          ),
                        ),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        UHelperFunctions.getFormattedDate(review.createdAt),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    review.review,
                    style: const TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

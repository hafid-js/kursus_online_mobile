import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_video.dart';

class UCoursePreview extends StatelessWidget {
  const UCoursePreview({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        URoundedVideo(
          videoUrl: videoUrl,
          isNetworkVideo: false,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 70,
          left: 145,

          child: Icon(Icons.play_arrow_rounded, size: 80, color: Colors.white),
        ),

        Positioned(
          top: 175,
          left: 120,

          child: Text(
            "Preview this course",
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

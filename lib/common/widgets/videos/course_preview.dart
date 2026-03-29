import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_video.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UCoursePreview extends StatefulWidget {
  const UCoursePreview({
    super.key,
    required this.videoUrl,
    required this.thumbnail,
  });

  final String videoUrl;
  final String thumbnail;

  @override
  State<UCoursePreview> createState() => _UCoursePreviewState();
}

class _UCoursePreviewState extends State<UCoursePreview> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openVideo() {
    showCupertinoModalBottomSheet(
      context: context,
      expand: true,
      backgroundColor: Colors.black,
      builder: (context) => Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.deepPurpleAccent,
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                _controller.pause();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        URoundedVideo(
          videoUrl: widget.thumbnail,
          isNetworkVideo: true,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 70,
          left: 145,
          child: GestureDetector(
            onTap: openVideo,
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),

        const Positioned(
          top: 175,
          left: 120,
          child: Text(
            "Preview this course",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
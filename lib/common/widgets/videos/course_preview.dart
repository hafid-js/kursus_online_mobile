import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_video.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController _controller;
  final ValueNotifier<bool> _showButton = ValueNotifier(true);
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) => setState(() {}));

    _controller.addListener(() {
      final value = _controller.value;
      if (value.isInitialized &&
          value.position >= value.duration &&
          !_showButton.value) {
        _showButton.value = true;
      }
    });

    _startHideTimer();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      _showButton.value = false;
    });
  }

  void _onTapPlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    _showButton.value = true;
    _startHideTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer?.cancel();
    _showButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        URoundedVideo(
          videoUrl: widget.thumbnail,
          isNetworkVideo: false,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 70,
          left: 145,
          child: GestureDetector(
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                expand: true,
                backgroundColor: Colors.black,
                builder: (context) => Stack(
                  children: [
                    Center(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),

                    Center(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _showButton,
                        builder: (context, visible, child) {
                          if (!visible) return const SizedBox.shrink();
                          return GestureDetector(
                            onTap: _onTapPlayPause,
                            child: ValueListenableBuilder<VideoPlayerValue>(
                              valueListenable: _controller,
                              builder: (context, value, child) {
                                if (!value.isInitialized)
                                  return const SizedBox.shrink();
                                return Icon(
                                  value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 50,
                                );
                              },
                            ),
                          );
                        },
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
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              );
            },
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
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

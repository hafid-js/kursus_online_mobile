import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/sizes.dart';
class URoundedVideo extends StatelessWidget {
  const URoundedVideo({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
    this.applyVideoRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkVideo = false,
    this.onTap,
    this.borderRadius = USizes.md,
  });

  final double? width, height;
  final String videoUrl;
  final bool applyVideoRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkVideo;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyVideoRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: _buildVideo(),
        ),
      ),
    );
  }

  Widget _buildVideo() {
    Widget video;
    if (videoUrl.isEmpty) {
      return const Icon(
        Icons.image_not_supported,
        color: Colors.grey,
      );
    }

    if (isNetworkVideo) {
      return Image.network(
        videoUrl,
        fit: fit,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.broken_image,
          color: Colors.grey,
        ),
      );
    } else {
      video = Image.asset(
      videoUrl,
      fit: fit,
      errorBuilder: (_, __, ___) => const Icon(
        Icons.broken_image,
        color: Colors.grey,
      ),
    );
    }

    return ColorFiltered(colorFilter: ColorFilter.mode(Colors.black.withAlpha(110), BlendMode.darken), child: video);

    
  }
}

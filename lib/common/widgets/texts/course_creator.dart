import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';

class UCourseCreator extends StatelessWidget {
  final List<String> creators;

  const UCourseCreator({
    super.key,
    required this.creators,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
        children: [
          const TextSpan(
            text: "Created by ",
            style: TextStyle(color: Colors.white),
          ),

          ..._buildCreators(),
        ],
      ),
    );
  }

  List<TextSpan> _buildCreators() {
    List<TextSpan> spans = [];

    for (int i = 0; i < creators.length; i++) {
      spans.add(
        TextSpan(
          text: creators[i],
          style: TextStyle(
            color: HexColor.fromHex("#9432C5"),
          ),
        ),
      );

      if (i < creators.length - 1) {
        spans.add(
          const TextSpan(
            text: " and ",
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    }

    return spans;
  }
}
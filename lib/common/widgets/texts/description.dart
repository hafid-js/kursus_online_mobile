import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';

class UDescription extends StatefulWidget {
  const UDescription({
    super.key,
    this.title,
    required this.description,
    this.isShowMore,
  });

  final String? title;
  final String? description;
  final bool? isShowMore;

  @override
  State<UDescription> createState() => _UDescriptionState();
}

class _UDescriptionState extends State<UDescription> {
  bool isExpanded = false;
  late bool isShowMore;

  @override
  void initState() {
    super.initState();

    isShowMore = widget.isShowMore ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
             if (isShowMore)
            Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            
          ],
        ),
        if (widget.title != null)
          Row(
            children: [
              Text(
                widget.title ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

        const SizedBox(height: 4),
        if (isShowMore)
          Text(
            widget.description ?? '',
            style: const TextStyle(color: Colors.white),
            maxLines: isExpanded ? null : 5,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          )
        else
          Text(widget.description ??'', style: const TextStyle(color: Colors.white)),

        const SizedBox(height: 8),
            if (isShowMore)
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "Show less" : "Show more",
            style: TextStyle(
              color: HexColor.fromHex("#9432C5"),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

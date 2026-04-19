import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    required this.title,
    this.titleSize,
    this.buttonTitle,
    this.onPressed,
    this.showActionButton = true
  });

  final String title;
  final double? titleSize;
  final String? buttonTitle;
  final VoidCallback? onPressed;
  final bool showActionButton;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(
          title,
          style: TextStyle(fontSize: titleSize ?? 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle ?? '', style: TextStyle(color: Colors.purpleAccent, fontSize: 14),)),
      ],
    );
  }
}

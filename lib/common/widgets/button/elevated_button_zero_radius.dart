import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/device_helpers.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';


class UElevatedButtonZeroRadius extends StatelessWidget {
  const UElevatedButtonZeroRadius({super.key, required this.onPressed, required this.child, this.bgColor, this.borderColor});

  final VoidCallback onPressed;
  final Widget child;
  final Color? bgColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: bgColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
    side: BorderSide(
      color: borderColor ?? Colors.transparent,
      width: 1
    )
  ),
);
       return SizedBox(
        height: 50,
        width: UDeviceHelper.getScreenWidth(context),
        child: ElevatedButton(onPressed: onPressed,  style: raisedButtonStyle, child: child,),
       );
  }
}
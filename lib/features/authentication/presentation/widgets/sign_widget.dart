import 'package:exam_productive_5/assets/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignWidget extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const SignWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: signInWidgetColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

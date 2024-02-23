import 'package:flutter/material.dart';

import '../../../../assets/constants/colors.dart';

class MyDivider extends StatelessWidget {
  final double width;
  const MyDivider({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      color: disabledButtonColor.withOpacity(0.2),
      height: 1,
    );
  }
}

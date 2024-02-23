import 'package:flutter/material.dart';

import '../../assets/constants/colors.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isDisabled;
  const MyButton({
    required this.onTap,
    this.isDisabled = false,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isDisabled) {
          onTap();
        }
      },
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDisabled ? disabledButtonColor : forgotPasswordTextColor,
        ),
        child: Center(
          child: Text(title,style:
           Theme.of(context).textTheme
              .displayMedium!.copyWith(
              color: isDisabled ? Colors.white.withOpacity(0.3) : Colors.white) ),
        )
      ),
    );
  }
}

import 'dart:async';

import 'package:exam_productive_5/assets/constants/icons.dart';
import 'package:exam_productive_5/assets/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed("/login");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(AppIcons.logo),
          ),
          const Gap(12),
          Text("Productive",
            style: Theme.of(context).textTheme
              .displayLarge),
          const Spacer(),

        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(40),
        child: SizedBox(width: 32,height: 32,
            child: CupertinoActivityIndicator(radius: 16,)),
      ),
    );
  }
}

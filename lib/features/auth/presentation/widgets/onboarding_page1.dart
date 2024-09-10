import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Image.asset(
            AppAssets.onboarding1,
            width: 1.sw,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Image.asset(
              AppAssets.logo,
              width: 125.w,
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
              child: Text(
                'Welcome to\n the world of distinguished real estate',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Here you can write anything related to this page.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
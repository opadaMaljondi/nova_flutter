import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
                LocaleKeys.welcom.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                LocaleKeys.youCanTypeAnything.tr(),
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

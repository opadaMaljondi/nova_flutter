import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Official websites',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.materialPrimary.shade700,
              ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  height: 34.h,
                  width: 33.w,
                  AppAssets.whatsUp,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  height: 34.h,
                  width: 33.w,
                  AppAssets.telegram,
                ),
              ),
              GestureDetector(
                child: Image.asset(
                  height: 34.h,
                  width: 33.w,
                  AppAssets.instgram,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  height: 34.h,
                  width: 33.w,
                  AppAssets.facebook,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  height: 34.h,
                  width: 33.w,
                  AppAssets.blackX,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class RealEstateHeader extends StatelessWidget {
  const RealEstateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              width: double.infinity,
              height: 216.h,
              fit: BoxFit.fill,
              AppAssets.estate1,
            ),
          ),
        ),
        SizedBox(
          height: 27.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 28.w,
            end: 41.w,
          ),
          child: Text(
            'Real estate prices are constantly rising in a new global phenomenon',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.primary,
                ),
          ),
        ),
      ],
    );
  }
}

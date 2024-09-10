

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class BoxProfileRealState extends StatelessWidget {
  const BoxProfileRealState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r)),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.rentHome,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'For sale',
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('7',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                        color: AppColors.black,
                      ))
                ],
              ),
            ),
            VerticalDivider(
              color: AppColors.black,
              thickness: 2.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.rentHome,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'for rent',
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('7',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                        color: AppColors.black,
                      ))
                ],
              ),
            ),
            VerticalDivider(
              color: AppColors.black,
              thickness: 2.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.rentHome,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Rented',
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    '7',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: AppColors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

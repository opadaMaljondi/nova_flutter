import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class CardFilter extends StatelessWidget {
  const CardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: 170.h,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.r)),
      padding:  EdgeInsets.all(10.h),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          AppAssets.estate1,
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ],
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ٌRoland Apartment',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.location,
                          color: AppColors.primary,
                        ),
                        Text(
                          '  City-Street',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.dolar,
                          color: AppColors.primary,
                        ),
                        Text(
                          '  2024/9/1',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.calender,
                          color: AppColors.primary,
                        ),
                        Text(
                          '  1500',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 6),
                          decoration: BoxDecoration(
                              color: AppColors.grayAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '  Not ٌRented',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

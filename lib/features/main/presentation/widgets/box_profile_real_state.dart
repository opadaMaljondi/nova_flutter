import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/translations/local_keys.g.dart';

class BoxProfileRealState extends StatelessWidget {
  const BoxProfileRealState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
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
                    LocaleKeys.rented.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('7',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.black,
                              ))
                ],
              ),
            ),
            VerticalDivider(
              color: AppColors.gray,
              thickness: 1.w,
              width: 0,
              endIndent: 10.h,
              indent: 10.h,
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
                    LocaleKeys.sale.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('7',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.black,
                              ))
                ],
              ),
            ),
            VerticalDivider(
              color: AppColors.gray,
              thickness: 1.w,
              width: 0,
              endIndent: 10.h,
              indent: 10.h,
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
                    LocaleKeys.forSale.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
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

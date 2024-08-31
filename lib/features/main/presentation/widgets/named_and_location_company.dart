import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';

class NameAndLocationCompany extends StatelessWidget {
  const NameAndLocationCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Al Wael Engineering Company',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 13.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: 20.sp,
              Icons.location_on,
              color: AppColors.mainGray,
            ),
            SizedBox(
              width: 11.w,
            ),
            Text(
              'Al Zubair - 24 Nessan Street',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.mainGray,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 21.h,
        ),
        PrimaryIconButton(
          onPressed: () {},
          borderRadius: BorderRadius.circular(14.r),
          color: AppColors.primary,
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 24.w,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                width: 16.w,
                height: 20.h,
                AppAssets.customLocationOn,
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                'Open the location on the map',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

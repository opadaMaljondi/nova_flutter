import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class TheOffice extends StatelessWidget {
  const TheOffice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The office',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              width: 69.w,
              height: 69.h,
              fit: BoxFit.fill,
              AppAssets.profile,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed Mansour',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primary,
                      size: 16.sp,
                    ),
                    Text(
                      'Abu Dhabi',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SvgPicture.asset(
              height: 56.h,
              width: 56.w,
              AppAssets.greenChat,
            ),
            SizedBox(
              width: 40.w,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

import '../../../../core/translations/local_keys.g.dart';

class TheOffice extends StatelessWidget {
  const TheOffice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.theOffice.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              ],
            ),
            SizedBox(
              height: 55.h,
              width: 55.w,
              child: Stack(alignment: Alignment.center, children: [
                SvgPicture.asset(
                  width: 55.w,
                  height: 55.h,
                  AppAssets.greenChat,
                ),
                Material(
                  color: AppColors.transparent,
                  child: InkWell(
                    splashColor:
                        AppColors.materialPrimary.shade300.withOpacity(0.4),
                    onTap: () => null,
                    borderRadius: BorderRadius.circular(27.r),
                  ),
                ),
              ]),
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

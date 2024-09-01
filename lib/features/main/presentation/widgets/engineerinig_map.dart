import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class EngineerinigMap extends StatelessWidget {
  const EngineerinigMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Engineering map',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              width: 33.w,
              height: 43.h,
              AppAssets.greenPdf,
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Woodland Engineering.jpeg',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '15 MB',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.gray,
                      ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SvgPicture.asset(
              width: 39.w,
              height: 39.h,
              AppAssets.greenDownload,
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

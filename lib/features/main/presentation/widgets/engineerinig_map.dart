import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class EngineerinigMap extends StatelessWidget {
  const EngineerinigMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        LocaleKeys.engineeringMap.tr(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      SizedBox(
        height: 20.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                width: 33.w,
                height: 43.h,
                AppAssets.greenPdf,
              ),
              SizedBox(
                width: 8.w,
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
              SizedBox(
                height: 45.h,
                width: 45.w,
                child: Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset(
                    width: 39.w,
                    height: 39.h,
                    AppAssets.greenDownload,
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      splashColor:
                          AppColors.materialPrimary.shade300.withOpacity(0.3),
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5.r),
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
      )
    ]);
  }
}

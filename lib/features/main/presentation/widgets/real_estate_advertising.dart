import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/youtube_video.dart';

class RealEstateAdvertising extends StatelessWidget {
  const RealEstateAdvertising({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 8.w,
        ).copyWith(
          top: 8.h,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: const Color(0x0000001C),
              blurRadius: 30.r,
            ),
          ],
        ),
        child: Column(
          children: [
            const YoutubeVideo(),
            SizedBox(
              height: 13.h,
            ),
            Text(
              LocaleKeys.realEstateAdvertising.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

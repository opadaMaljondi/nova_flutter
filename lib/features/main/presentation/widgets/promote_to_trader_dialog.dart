import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class PromoteToTraderDialog extends StatelessWidget {
  const PromoteToTraderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: LottieBuilder.asset(
        width: 90.w,
        height: 90.h,
        AppAssets.quastionMark,
      ),
      iconPadding: EdgeInsetsDirectional.only(
        top: 22.h,
        bottom: 16.h,
      ),
      title: Text(
        LocaleKeys.w0elcomeToTheFreeTrial.tr(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.black,
            ),
      ),
      titlePadding: EdgeInsetsDirectional.only(
        bottom: 60.h,
        end: 30.w,
        start: 30.w,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.r),
                    color: const Color(0xff2E3336),
                  ),
                  child: Text(
                    LocaleKeys.next.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.r),
                    color: const Color(0xff2A8478),
                  ),
                  child: Text(
                    LocaleKeys.promotion.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

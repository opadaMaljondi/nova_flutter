import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class LanguageField extends StatefulWidget {
  const LanguageField({
    super.key,
  });

  @override
  State<LanguageField> createState() => _LanguageFieldState();
}

class _LanguageFieldState extends State<LanguageField> {
  bool iconDirection = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              iconDirection = value;
            });
          },
          backgroundColor: AppColors.primary.withOpacity(.09),
          tilePadding: EdgeInsetsDirectional.only(start: 10.w),
          childrenPadding: EdgeInsetsDirectional.only(
            start: 30.w,
            end: 16.w,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(12.r),
          ),
          title: Row(
            children: [
              SvgPicture.asset(
                AppAssets.language,
                height: 25.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                LocaleKeys.language.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          trailing: Padding(
            padding: REdgeInsetsDirectional.only(end: 10.w),
            child: Icon(
              iconDirection == true
                  ? Icons.keyboard_arrow_down_rounded
                  : context.locale.languageCode == 'ar'
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded,
              color: AppColors.primary,
              size: 30.sp,
            ),
          ),
          children: [
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                context.setLocale(
                  const Locale('ar'),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.arabic.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.check,
                    size: 28.sp,
                    color: context.locale.languageCode == 'ar'
                        ? AppColors.primary
                        : AppColors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () {
                context.setLocale(
                  const Locale('en'),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.english.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.check,
                    size: 28.sp,
                    color: context.locale.languageCode == 'en'
                        ? AppColors.primary
                        : AppColors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

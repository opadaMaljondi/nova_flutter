import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    bool languageIsArabic = context.locale.languageCode == 'ar';

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.grayMiddle,
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(26.r),
                topStart: Radius.circular(26.r),
              ),
            ),
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                splashColor: AppColors.materialPrimary.shade400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(languageIsArabic ? 0 : 26.r),
                  bottomLeft: Radius.circular(languageIsArabic ? 0 : 26.r),
                  bottomRight: Radius.circular(languageIsArabic ? 26.r : 0),
                  topRight: Radius.circular(languageIsArabic ? 26.r : 0),
                ),
                onTap: () {
                  setState(() {
                    number++;
                  });
                },
                child: Icon(
                  CupertinoIcons.add,
                  size: 28.sp,
                  color: AppColors.gray,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            height: 50.h,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
            ),
            child: Text(
              "$number",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: const Color(0xff060606).withOpacity(.23)),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.grayMiddle,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(26.r),
                bottomEnd: Radius.circular(26.r),
              ),
            ),
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    number--;
                  });
                },
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(languageIsArabic ? 26.r : 0),
                  bottomLeft: Radius.circular(languageIsArabic ? 26.r : 0),
                  bottomRight: Radius.circular(languageIsArabic ? 0 : 26.r),
                  topRight: Radius.circular(languageIsArabic ? 0 : 26.r),
                ),
                child: Icon(
                  CupertinoIcons.minus,
                  size: 28.sp,
                  color: AppColors.gray,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

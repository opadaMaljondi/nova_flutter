import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final void Function()? onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 75.w,
                  height: 75.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

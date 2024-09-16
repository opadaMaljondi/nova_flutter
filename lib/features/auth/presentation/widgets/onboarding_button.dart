import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const OnboardingButton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: MaterialButton(
        onPressed: onPressed,
        disabledColor: AppColors.mainGray.withOpacity(0.5),
        color: AppColors.materialPrimary.shade700.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.r),
          side: const BorderSide(color: AppColors.primary20),
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                context.locale.languageCode == 'ar'
                    ? Icons.keyboard_double_arrow_left_rounded
                    : Icons.keyboard_double_arrow_right_rounded,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

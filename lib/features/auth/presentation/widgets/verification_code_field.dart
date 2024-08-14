import 'package:flutter/material.dart' as material show TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class VerificationCodeField extends StatelessWidget {
  final void Function(String verificationCode)? onCompleted;
  final void Function(String verificationCode)? onChanged;

  const VerificationCodeField({super.key, this.onCompleted, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: material.TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.black30,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Pinput(
          onCompleted: onCompleted,
          onChanged: onChanged,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          length: 4,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          defaultPinTheme: PinTheme(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5.r),
              ),
              border: Border(
                bottom: BorderSide(
                  width: 4.w,
                  color: AppColors.black20,
                ),
              ),
            ),
            height: 50.h,
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
          focusedPinTheme: PinTheme(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5.r),
              ),
              border: Border(
                bottom: BorderSide(
                  width: 4.w,
                  color: AppColors.primary,
                ),
              ),
            ),
            height: 50.h,
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
          separatorBuilder: (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset(AppAssets.line),
          ),
        ),
      ),
    );
  }
}

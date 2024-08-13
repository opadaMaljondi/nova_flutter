import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIconsChosen extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final IconData firstIcon;
  final IconData secondIcon;
  final void Function()? onFirstIconPressed;
  final void Function()? onSecondIconPressed;

  const PrimaryIconsChosen({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.firstIcon,
    required this.secondIcon,
    this.onFirstIconPressed,
    this.onSecondIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              PrimaryIconButton(
                icon: Icon(
                  firstIcon,
                  size: 35.w,
                  color: AppColors.primary,
                ),
                onPressed: onFirstIconPressed,
                padding: EdgeInsets.all(30.w),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                firstLabel,
              )
            ],
          ),
          Column(
            children: [
              PrimaryIconButton(
                icon: Icon(
                  secondIcon,
                  size: 35.w,
                  color: AppColors.primary,
                ),
                onPressed: onSecondIconPressed,
                padding: EdgeInsets.all(30.w),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                secondLabel,
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_colors.dart';

class ShortcutButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final void Function()? onTap;

  const ShortcutButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: SvgPicture.asset(iconPath),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            textAlign: TextAlign.center,
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

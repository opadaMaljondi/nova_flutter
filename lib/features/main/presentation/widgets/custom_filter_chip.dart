import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color activeColor;
  final void Function(bool)? onSelected;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.activeColor,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.h),
      backgroundColor: isSelected ? activeColor : AppColors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
        side: BorderSide(
          color: isSelected ? AppColors.transparent : AppColors.mainGray,
          width: 1,
        ),
      ),
      onSelected: onSelected,
      label: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: isSelected ? AppColors.white : AppColors.black10,
            ),
      ),
    );
  }
}

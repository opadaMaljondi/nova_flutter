import 'package:real_state/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      backgroundColor: isSelected ? activeColor : AppColors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.sp),
        side: const BorderSide(color: AppColors.transparent),
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

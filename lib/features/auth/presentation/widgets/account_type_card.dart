// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_colors.dart';

class AccountTypeCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final void Function()? onTap;

  const AccountTypeCard({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          height: 80.h,
          padding: EdgeInsets.all(15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.mainGray,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                iconPath,
                color: isSelected ? AppColors.primary : AppColors.mainGray,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.mainGray,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

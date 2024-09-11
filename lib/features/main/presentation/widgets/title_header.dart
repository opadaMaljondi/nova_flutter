import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const TitleHeader({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ).copyWith(top: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              child: Text(
                LocaleKeys.showAll.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            LocaleKeys.or.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.primary,
                ),
          ),
          SizedBox(width: 10.w),
          const Expanded(
            child: Divider(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

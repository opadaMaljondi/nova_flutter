import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';

class PrimaryAppbar extends StatelessWidget {
  final String title;

  const PrimaryAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryIconButton(
            color: !context.canPop() ? AppColors.transparent : null,
            onPressed: context.canPop()
                ? () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  }
                : null,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: !context.canPop() ? AppColors.transparent : null,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const PrimaryIconButton(
            color: AppColors.transparent,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

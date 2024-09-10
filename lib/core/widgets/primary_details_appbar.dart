import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PrimaryDetailsAppbar extends StatelessWidget {
  final String title;

  const PrimaryDetailsAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.materialPrimary.shade400,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -100,
            top: -35,
            child: SvgPicture.asset(
              AppAssets.backgroundAppbar,
              height: 200.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
            child: Row(
              children: [
                PrimaryIconButton(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  onPressed: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ),
                const PrimaryIconButton(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

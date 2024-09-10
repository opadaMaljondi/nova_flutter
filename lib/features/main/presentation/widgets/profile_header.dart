import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:real_state/core/widgets/primary_image_picker.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0.w,
            right: 0.w,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
              decoration: BoxDecoration(
                color: AppColors.materialPrimary,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.materialPrimary.shade400.withOpacity(0.6),
                    AppColors.materialPrimary.shade700.withOpacity(0.9),
                  ],
                ),
              ),
              height: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryIconButton(
                    color: AppColors.white,
                    onPressed: () => context.pop(),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: !context.canPop() ? AppColors.transparent : null,
                    ),
                  ),
                  SvgPicture.asset(AppAssets.editProfle),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 75.h,
              width: 1.sw,
              decoration: BoxDecoration(
                color: AppColors.white20,
                borderRadius: BorderRadius.circular(35.r),
              ),
            ),
          ),
          Positioned(
            top: 75.h,
            child: const PrimaryImagePicker(),
          ),
        ],
      ),
    );
  }
}

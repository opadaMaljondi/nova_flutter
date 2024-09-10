import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PrimaryIconButton(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {},
                child: SvgPicture.asset(
                  AppAssets.profile,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ahmad Nasser",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 15,
                      ),
                      Text(
                        "Abo Daby",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              PrimaryIconButton(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {},
                child: SvgPicture.asset(
                  AppAssets.support,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              PrimaryIconButton(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.notificationsScreen);
                },
                child: SvgPicture.asset(
                  AppAssets.notifications,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

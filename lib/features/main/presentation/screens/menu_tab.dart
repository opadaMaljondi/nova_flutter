import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Properties",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Add words about features and characteristics",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SettingCard(
                      name: 'Favorite Properties',
                      iconPath: AppAssets.favorite,
                      onTap: () {
                        context.push(AppRoutes.favoriteScreen);
                      },
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Offices',
                      iconPath: AppAssets.offices,
                      onTap: () {
                        context.push(AppRoutes.officesScreen);
                      },
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Properties News',
                      iconPath: AppAssets.favorite,
                      onTap: () {
                        context.push(AppRoutes.newsScreen);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Communication",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Add a description about the contact",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SettingCard(
                      name: 'About us',
                      iconPath: AppAssets.aboutUs,
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Support',
                      iconPath: AppAssets.support,
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Legal Advisor',
                      iconPath: AppAssets.advisor,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Add a description about the account",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SettingCard(
                      name: 'My Account',
                      iconPath: AppAssets.profile,
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Upgrade to office',
                      iconPath: AppAssets.upgradeToOffice,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appearance",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Add a description about the appearance",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SettingCard(
                      name: 'Notifications',
                      iconPath: AppAssets.notifications,
                      onChanged: (value) {},
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Dark Mode',
                      iconPath: AppAssets.darkMode,
                      onChanged: (value) {},
                    ),
                    const Divider(
                      color: AppColors.grayAccent,
                    ),
                    SettingCard(
                      name: 'Language',
                      iconPath: AppAssets.language,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25.r),
                  ),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingCard(
                      name: 'Logout',
                      iconPath: AppAssets.logout,
                      color: AppColors.danger,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  'version 1.0.0',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

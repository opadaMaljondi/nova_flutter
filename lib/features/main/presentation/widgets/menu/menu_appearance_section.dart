import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';

class MenuAppearanceSection extends StatelessWidget {
  const MenuAppearanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
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
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';

import '../../../../../core/translations/local_keys.g.dart';

class MenuPropertiesSection extends StatelessWidget {
  const MenuPropertiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 24.h,
          ),
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
                LocaleKeys.characteristics.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                LocaleKeys.addWords.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 15.h,
              ),
              SettingCard(
                name: LocaleKeys.favorites.tr(),
                iconPath: AppAssets.favorite,
                onTap: () {
                  context.push(AppRoutes.favoriteScreen);
                },
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.office.tr(),
                iconPath: AppAssets.offices,
                onTap: () {
                  context.push(AppRoutes.officesScreen);
                },
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.realEstateNews.tr(),
                iconPath: AppAssets.realStateNews,
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
      ],
    );
  }
}

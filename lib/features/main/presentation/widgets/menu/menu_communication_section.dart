import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';

import '../../../../../core/translations/local_keys.g.dart';

class MenuCommunicationSection extends StatelessWidget {
  const MenuCommunicationSection({super.key});

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
                LocaleKeys.communication.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                LocaleKeys.addDecriptionAboutContact.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 15.h,
              ),
              SettingCard(
                name: LocaleKeys.aboutUs.tr(),
                iconPath: AppAssets.aboutUs,
                onTap: () {
                  context.push(AppRoutes.aboutUsScreen);
                },
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.contactSupport.tr(),
                iconPath: AppAssets.support,
                onTap: () {},
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.legalAdvisor.tr(),
                iconPath: AppAssets.advisor,
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

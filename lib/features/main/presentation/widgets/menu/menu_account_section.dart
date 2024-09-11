import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';

import '../../../../../core/translations/local_keys.g.dart';

class MenuAccountSection extends StatelessWidget {
  const MenuAccountSection({super.key});

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
                LocaleKeys.account.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                LocaleKeys.addDescriptionAboutAccount.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 15.h,
              ),
              SettingCard(
                name: LocaleKeys.myAccount.tr(),
                iconPath: AppAssets.profile,
                onTap: () {
                  context.push(AppRoutes.profileScreen);
                },
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.upgradeToOffice.tr(),
                iconPath: AppAssets.upgradeToOffice,
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

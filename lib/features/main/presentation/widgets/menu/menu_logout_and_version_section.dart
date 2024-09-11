import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';

import '../../../../../core/translations/local_keys.g.dart';

class MenuLogoutAndVersionSection extends StatelessWidget {
  const MenuLogoutAndVersionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
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
                name: LocaleKeys.logOut.tr(),
                iconPath: AppAssets.logout,
                color: AppColors.danger,
                onTap: () {
                  context.go(AppRoutes.signInScreen);
                },
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
    );
  }
}

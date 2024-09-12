import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/setting_card.dart';
import '../../../../../core/translations/local_keys.g.dart';

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
                LocaleKeys.appearance.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                LocaleKeys.addDescriptionOfTheAppearance.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 15.h,
              ),
              SettingCard(
                name: LocaleKeys.notifications.tr(),
                iconPath: AppAssets.notifications,
                onChanged: (value) {},
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.darkMode.tr(),
                iconPath: AppAssets.darkMode,
                onChanged: (value) {},
              ),
              const Divider(
                color: AppColors.grayAccent,
              ),
              SettingCard(
                name: LocaleKeys.language.tr(),
                iconPath: AppAssets.language,
                onTap: () {
                  Logger().w(context.locale.languageCode);
                  context.setLocale(
                    Locale(
                      context.locale.languageCode == 'ar' ? 'en' : 'ar',
                    ),
                  );
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

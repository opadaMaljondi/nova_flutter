import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/official_numbers.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/social_media_icons.dart';

import '../../../../core/translations/local_keys.g.dart';
import '../../domain/contact.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialPrimary.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                PositionedDirectional(
                  start: 0,
                  top: 0.8.sh,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      height: 0.5.sh,
                      AppAssets.aboutUsBackground,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryAppbar(
                      title: LocaleKeys.whoAreWe.tr(),
                    ),
                    Divider(
                      thickness: 0.3,
                      color: AppColors.mainGray,
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Image.asset(
                      width: 125.w,
                      height: 95.h,
                      AppAssets.logo,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      LocaleKeys.titleAbouteUs.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            height: 1.7.h,
                            color: AppColors.materialPrimary.shade700,
                          ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        LocaleKeys.subTitleAboutUs.tr(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.black,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    const OfficialNumbers(),
                    SizedBox(
                      height: 50.h,
                    ),
                    SocialMediaIcons(
                      contactInfo: ContactInfoEntity(),
                    ),
                    SizedBox(
                      height: 85.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

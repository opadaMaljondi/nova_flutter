import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/official_numbers.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/social_media_icons.dart';

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
                    const PrimaryAppbar(
                      title: 'Who Are We',
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
                      height: 40.h,
                    ),
                    Text(
                      'Hey, you',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.materialPrimary.shade700,
                          ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        'In the distinguished world of real estate',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.materialPrimary.shade700,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        'Here you can write anything related to this page Here you can write anything related to this page Here you can write anything related to this page Here you can write anything related to this page You can write anything related to this page Here you can write anything related to this page Here you can write anything related to this page Related to this page',
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
                    const SocialMediaIcons(),
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

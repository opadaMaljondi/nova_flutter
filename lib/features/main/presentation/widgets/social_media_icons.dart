import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/translations/local_keys.g.dart';
import '../../../../core/widgets/primary_icon_button.dart';
import '../../domain/contact.dart';

class SocialMediaIcons extends StatelessWidget {
  final ContactInfoEntity contactInfo;

  const SocialMediaIcons({
    super.key,
    required this.contactInfo,
  });

  launchLink(String link) async {
    final Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.officialWebsites.tr(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.materialPrimary.shade700,
              ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryIconButton(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {
                  final Uri uri = Uri.parse(
                    'https://wa.me/963939754627',
                  );
                  launchUrl(uri);
                },
                child: SvgPicture.asset(
                  AppAssets.whatsUp,
                ),
              ),
              PrimaryIconButton(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {
                  launchLink(contactInfo.telegram!);
                },
                child: SvgPicture.asset(
                  AppAssets.telegram,
                ),
              ),
              PrimaryIconButton(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {
                  launchLink(contactInfo.telegram!);
                },
                child: FittedBox(
                  child: CircleAvatar(
                    radius: 22.r,
                    child: Image.asset(AppAssets.insta),
                  ),
                ),
              ),
              PrimaryIconButton(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {
                  launchLink(contactInfo.telegram!);
                },
                child: SvgPicture.asset(
                  AppAssets.facebook,
                ),
              ),
              PrimaryIconButton(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(50.r),
                onPressed: () {
                  launchLink(contactInfo.telegram!);
                },
                child: SvgPicture.asset(
                  AppAssets.blackX,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

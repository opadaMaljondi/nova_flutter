import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/shortcut_button.dart';
import 'package:real_state/features/main/presentation/widgets/title_header.dart';

class WhatDoYouWantSection extends StatelessWidget {
  const WhatDoYouWantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(
          title: LocaleKeys.whatDoYouWant.tr(),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShortcutButton(
                iconPath: AppAssets.sell,
                label: LocaleKeys.sale.tr(),
                onTap: () {},
              ),
              ShortcutButton(
                iconPath: AppAssets.rent,
                label: LocaleKeys.rent.tr(),
                onTap: () {},
              ),
              ShortcutButton(
                iconPath: AppAssets.commercial,
                label: LocaleKeys.commercial.tr(),
                onTap: () {},
              ),
              ShortcutButton(
                iconPath: AppAssets.apartments,
                label: LocaleKeys.apartments.tr(),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

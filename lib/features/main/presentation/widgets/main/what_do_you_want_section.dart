import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/features/main/presentation/widgets/shortcut_button.dart';
import 'package:real_state/features/main/presentation/widgets/title_header.dart';

class WhatDoYouWantSection extends StatelessWidget {
  const WhatDoYouWantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleHeader(title: "What do you want ?"),
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
                label: 'Sale',
                onTap: () {},
              ),
              ShortcutButton(
                iconPath: AppAssets.rent,
                label: 'Rent',
                onTap: () {},
              ),
              ShortcutButton(
                iconPath: AppAssets.commercial,
                label: 'Commercial',
                onTap: () {},
              ),
              ShortcutButton(
                iconPath: AppAssets.apartments,
                label: 'Apartments',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

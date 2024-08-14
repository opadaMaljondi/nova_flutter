import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';

class AuthHeaderSection extends StatelessWidget {
  final String title;
  final String iconPath;
  final String subTitle;

  const AuthHeaderSection({
    super.key,
    required this.title,
    required this.iconPath,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (context.canPop())
          Positioned(
            top: 50.h,
            left: context.locale.languageCode != 'ar' ? 20.w : null,
            right: context.locale.languageCode == 'ar' ? 20.w : null,
            child: PrimaryIconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
              ),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
            ),
          ),
        Column(
          children: [
            SizedBox(height: 50.h),
            SvgPicture.asset(iconPath),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
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
  final bool isLargeContent;

  const AuthHeaderSection({
    super.key,
    required this.title,
    required this.iconPath,
    required this.subTitle,
    this.isLargeContent = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (context.canPop())
            Positioned(
              top: 35.h,
              left: context.locale.languageCode != 'ar' ? 20.w : null,
              right: context.locale.languageCode == 'ar' ? 20.w : null,
              child: PrimaryIconButton(
                child: const Icon(
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
              SizedBox(height: isLargeContent ? 35.h : 100.h),
              SvgPicture.asset(iconPath),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 5.h),
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
      ),
    );
  }
}

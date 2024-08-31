import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Contact information',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.r),
          decoration: BoxDecoration(
            color: AppColors.grayAccent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    height: 24.h,
                    width: 24.w,
                    AppAssets.greenWebsite,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'websiteedsaam.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    height: 15.h,
                    width: 22.w,
                    AppAssets.greenEmail,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'email.45.ee@gmsil.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    height: 20.h,
                    width: 20.w,
                    AppAssets.greenPhone,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    '+97 955 966 95',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Divider(
                color: const Color(0xff464646).withOpacity(0.14),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      height: 34.h,
                      width: 33.w,
                      AppAssets.greenWhatesup,
                    ),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      height: 34.h,
                      width: 33.w,
                      AppAssets.greenTelegram,
                    ),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      height: 34.h,
                      width: 33.w,
                      AppAssets.greenInstegram,
                    ),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      height: 34.h,
                      width: 33.w,
                      AppAssets.greenFacebook,
                    ),
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      height: 34.h,
                      width: 33.w,
                      AppAssets.greenX,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

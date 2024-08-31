import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class AboutTheCompany extends StatelessWidget {
  const AboutTheCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'About the company',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 25.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.grayAccent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'You can write the description you want here You can write the description you want here You can write the description you want here You can write the description you want here',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.gray,
                ),
          ),
        ),
      ],
    );
  }
}

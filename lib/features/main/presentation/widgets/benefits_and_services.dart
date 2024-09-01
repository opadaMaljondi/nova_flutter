import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class BenefitsAndServices extends StatelessWidget {
  const BenefitsAndServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Benefits and services',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.r),
              topStart: Radius.circular(10.r),
            ),
          ),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Internet',
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: AppColors.grayAccent,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'elevator',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(.38),
          ),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Surveillance cameras',
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: AppColors.grayAccent,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'swimming pool',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: const BoxDecoration(
            color: AppColors.lightGrey,
          ),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Furnished',
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: AppColors.grayAccent,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'garden',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

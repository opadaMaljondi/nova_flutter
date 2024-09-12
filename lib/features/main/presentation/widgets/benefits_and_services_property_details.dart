import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class BenefitsAndServicesPropertyDetails extends StatelessWidget {
  const BenefitsAndServicesPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.benefitsAndServices.tr(),
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
          child: Row(
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.internet.tr(),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: AppColors.grayAccent,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.elevator.tr(),
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
          child: Row(
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.surveillanceCameras.tr(),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: AppColors.grayAccent,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.swimmingPool.tr(),
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
          child: Row(
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.furnished.tr(),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: AppColors.grayAccent,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.garden.tr(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.details.tr(),
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
                flex: 2,
                child: Text(
                  LocaleKeys.propertyCode.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'awaaaaasa89x',
                  style: Theme.of(context).textTheme.titleSmall,
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
                flex: 2,
                child: Text(
                  LocaleKeys.propertyArea.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '210',
                  style: Theme.of(context).textTheme.titleSmall,
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
                flex: 2,
                child: Text(
                  LocaleKeys.numberOfBedrooms.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '8',
                  style: Theme.of(context).textTheme.titleSmall,
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
            color: AppColors.lightGrey.withOpacity(0.38),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  LocaleKeys.numberOfBathrooms.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '4',
                  style: Theme.of(context).textTheme.titleSmall,
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
                flex: 2,
                child: Text(
                  LocaleKeys.numberOfFloors.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '5',
                  style: Theme.of(context).textTheme.titleSmall,
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
                flex: 2,
                child: Text(
                  LocaleKeys.carParking.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'There is',
                  style: Theme.of(context).textTheme.titleSmall,
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
            color: AppColors.lightGrey,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.r),
              bottomStart: Radius.circular(10.r),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  LocaleKeys.yearOfConstruction.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '2020-05-25',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

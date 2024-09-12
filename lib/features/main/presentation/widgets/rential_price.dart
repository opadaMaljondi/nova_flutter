import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class RentalPrice extends StatelessWidget {
  const RentalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.rentalPrice.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '1500 \$  ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.primary,
                    ),
              ),
              Text(
                '/  ${LocaleKeys.month.tr()}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.mainGray,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

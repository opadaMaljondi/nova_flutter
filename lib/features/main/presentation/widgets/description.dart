import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.description.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: const Text(
            'You can write the description you want here You can write the description you want here You can write the description you want here You can write the description you want here',
          ),
        ),
      ],
    );
  }
}

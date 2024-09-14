import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

import '../../../../core/translations/local_keys.g.dart';

class OfficialNumbers extends StatelessWidget {
  const OfficialNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.officialNumbers.tr(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.materialPrimary.shade700,
              ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.ceo.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      ),
                ),
                Text(
                  LocaleKeys.forAdvertising.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '+96 959 999 333',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.black,
                      ),
                ),
                Text(
                  '+96 959 999 333',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.black,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

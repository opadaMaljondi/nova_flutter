import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class OfficialNumbers extends StatelessWidget {
  const OfficialNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Official numbers',
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
                  'CEO:',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      ),
                ),
                Text(
                  'For advertising:',
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

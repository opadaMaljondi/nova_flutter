import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class PropertyDetailsHeader extends StatelessWidget {
  const PropertyDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Woodland Estate',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColors.primary,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                'Al Tanomah Airport Street - Al Zubair City',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

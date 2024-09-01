import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';

class LocationOnMap extends StatelessWidget {
  const LocationOnMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location on map',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 11.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            height: 190.h,
            width: double.infinity,
            fit: BoxFit.fill,
            AppAssets.estate1,
          ),
        ),
      ],
    );
  }
}

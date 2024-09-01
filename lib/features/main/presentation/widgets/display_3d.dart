import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';

class Display3D extends StatelessWidget {
  const Display3D({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '3D display',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 9.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            height: 480.h,
            width: double.infinity,
            fit: BoxFit.fill,
            AppAssets.estate1,
          ),
        ),
      ],
    );
  }
}

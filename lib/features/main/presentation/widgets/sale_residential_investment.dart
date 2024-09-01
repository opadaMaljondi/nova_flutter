import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class SaleResidentialInestment extends StatelessWidget {
  const SaleResidentialInestment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 23.h,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.materialPrimary.shade500,
                    child: const Icon(
                      Icons.home,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  const Text(
                    'sale',
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.materialPrimary.shade500,
                    child: const Icon(
                      Icons.home,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  const Text(
                    'residential',
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.materialPrimary.shade500,
                child: const Icon(
                  Icons.home,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              const Text(
                'investment',
              ),
              SizedBox(
                width: 40.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

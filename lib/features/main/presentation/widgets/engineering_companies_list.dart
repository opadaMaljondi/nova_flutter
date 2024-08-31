import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';

class EngineeringCompaniesLits extends StatelessWidget {
  const EngineeringCompaniesLits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 22.h,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 9.h,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.comapanyInfoScreen);
            },
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 20.r,
                    color: const Color(0x0000000D),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      height: 123.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      AppAssets.estate1,
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    'Al Wael Engineering Company',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        size: 20.sp,
                        Icons.location_on,
                        color: AppColors.mainGray,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Text(
                        'Al Zubair - 24 Nessan Street',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.mainGray,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

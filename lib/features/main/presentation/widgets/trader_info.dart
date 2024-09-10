import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class TraderInfo extends StatelessWidget {
  const TraderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(26.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Color(0xffC0F2DB),
                Color(0xff2A8478),
              ],
            ),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                height: 141.h,
                width: 141.w,
                AppAssets.profile,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Ahmed mansour',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      'Abu Dhabi - Al Rahma - Street 24',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      '+96 955666333',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(22.r),
                          bottomStart: Radius.circular(22.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: AppColors.primary,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Text(
                            'contact',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(22.r),
                          topEnd: Radius.circular(22.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.messaging,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Text(
                            'Messaging',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 24.h,
            start: 24.w,
          ),
          child: GestureDetector(
            child: SvgPicture.asset(
              AppAssets.verticalMenu,
            ),
          ),
        ),
      ],
    );
  }
}
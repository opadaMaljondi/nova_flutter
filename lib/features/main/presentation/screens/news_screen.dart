import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/news_card.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryAppbar(title: 'Properties News'),
              Divider(
                thickness: 1,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              SizedBox(
                height: 180.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.sp),
                      color: AppColors.primary,
                      image: const DecorationImage(
                        image: AssetImage(
                          AppAssets.estate1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 10.w,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(
                  bottom: 40.h,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => const NewsCard(),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 15.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

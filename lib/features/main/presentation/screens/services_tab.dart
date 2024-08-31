import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  List<String> items = [
    'Engineering companies',
    'Real estate companies',
    'Contact a representative',
    'Contact support',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 48.h,
          horizontal: 16.w,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11.w,
          mainAxisSpacing: 11.h,
          childAspectRatio: 1,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                index == 0
                    ? AppRoutes.ebgineeringComapniesscreen
                    : AppRoutes.aboutUsScreen,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Column(
                children: [
                  Text(
                    items[index],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.primary,
                        ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

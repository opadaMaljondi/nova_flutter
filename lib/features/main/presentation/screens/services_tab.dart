import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/domain/entities/services_entity.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  List<PairEntity> items = [
    PairEntity(
      text1: AppAssets.engineeringCompanies,
      text2: 'Engineering\ncompanies',
    ),
    PairEntity(
      text1: AppAssets.realEstateCompanies,
      text2: 'Real estat\ncompanies',
    ),
    PairEntity(
      text1: AppAssets.conectArepresentitve,
      text2: 'Contact a\nrepresentative',
    ),
    PairEntity(
      text1: AppAssets.conectSupport,
      text2: 'Contact\nsupport',
    ),
    PairEntity(
      text1: AppAssets.legalAdvisor,
      text2: 'Legal\nadvisor',
    ),
    PairEntity(
      text1: AppAssets.realEstateConsultant,
      text2: 'Real estate\nconsultant',
    ),
    PairEntity(
      text1: AppAssets.investmentAdvisor,
      text2: 'Investment\ndvisor',
    ),
    PairEntity(
      text1: AppAssets.propertyMaintenance,
      text2: 'Property\nmaintenance',
    ),
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
        itemCount: 8,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    width: 65.w,
                    height: 65.h,
                    fit: BoxFit.fill,
                    items[index].text1,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      items[index].text2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.primary,
                          ),
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

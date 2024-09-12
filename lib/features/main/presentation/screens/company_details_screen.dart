import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/about_the_company.dart';
import 'package:real_state/features/main/presentation/widgets/contaci_info.dart';
import 'package:real_state/features/main/presentation/widgets/named_and_location_company.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

import '../../domain/contact.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(
                title: "Al Wael Engineering",
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  Image.asset(
                    height: 0.25.sh,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    AppAssets.estate1,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 25.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(35.r)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                color: AppColors.white,
                child: Column(
                  children: [
                    const NameAndLocationCompany(),
                    SizedBox(
                      height: 25.h,
                    ),
                    const AboutTheCompany(),
                    SizedBox(
                      height: 25.h,
                    ),
                     ContactInfo(contactInfo:ContactInfoEntity() ,),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

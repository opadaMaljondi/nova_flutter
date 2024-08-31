import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/features/main/presentation/widgets/about_the_company.dart';
import 'package:real_state/features/main/presentation/widgets/contaci_info.dart';
import 'package:real_state/features/main/presentation/widgets/named_and_location_company.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PrimaryAppbar(
            title: "Al Wael Engineering Company",
          ),
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Image.asset(
                height: 0.3.sh,
                width: double.infinity,
                fit: BoxFit.fill,
                AppAssets.estate1,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 0.25.sh),
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: 20.w).copyWith(
                  top: 28.h,
                  bottom: 47.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20.r),
                    topStart: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  children: [
                    const NameAndLocationCompany(),
                    SizedBox(
                      height: 27.h,
                    ),
                    const AboutTheCompany(),
                    SizedBox(
                      height: 24.h,
                    ),
                    const ContactInfo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

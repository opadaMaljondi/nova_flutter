import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/engineering_companies_list.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

class EngineeringCompaniesScreen extends StatelessWidget {
  const EngineeringCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(
                title: "Engineering companies",
              ),
              Divider(
                thickness: 1,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              const EngineeringCompaniesLits(),
            ],
          ),
        ),
      ),
    );
  }
}

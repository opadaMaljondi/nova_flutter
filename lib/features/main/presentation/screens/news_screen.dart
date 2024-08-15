import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/broker_card.dart';
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
              const PrimaryAppbar(title: 'Offices'),
              Divider(
                thickness: 1,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(
                  bottom: 40.h,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30.h,
                  crossAxisSpacing: 30.w,
                  childAspectRatio: 0.7,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => const BrokerCard(
                  isCircle: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

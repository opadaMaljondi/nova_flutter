import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/real_estate_advertising.dart';
import 'package:real_state/features/main/presentation/widgets/real_estate_header.dart';
import 'package:real_state/features/main/presentation/widgets/rent_a_property.dart';
import 'package:real_state/features/main/presentation/widgets/review_articles.dart';

class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryAppbar(
                title: 'Real estate',
              ),
              Divider(
                thickness: 1,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              SizedBox(
                height: 18.h,
              ),
              const RealEstateHeader(),
              SizedBox(
                height: 10.h,
              ),
              const ReviewArticles(),
              SizedBox(
                height: 18.h,
              ),
              const RealEstateAdvertising(),
              SizedBox(
                height: 35.h,
              ),
              const RentAproperty(),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 21.w,
                  end: 13.w,
                ),
                child: Text(
                  'Ultimately, the choice between renting and selling a property should align with your financial goals and personal circumstances, taking into account current market conditions',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/real_estate_advertising.dart';
import 'package:real_state/features/main/presentation/widgets/real_estate_header.dart';
import 'package:real_state/features/main/presentation/widgets/rent_a_property.dart';
import 'package:real_state/features/main/presentation/widgets/review_articles.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryAppbar(
                title: LocaleKeys.realEstate.tr(),
              ),
              Divider(
                thickness: 0.3,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              const RealEstateHeader(),
              SizedBox(
                height: 20.h,
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
                  style: Theme.of(context).textTheme.bodyMedium,
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

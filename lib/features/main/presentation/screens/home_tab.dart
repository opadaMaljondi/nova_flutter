import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main/presentation/widgets/main/brokers_section.dart';
import 'package:real_state/features/main/presentation/widgets/main/featured_properties_section.dart';
import 'package:real_state/features/main/presentation/widgets/main/home_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/main/home_search_field.dart';
import 'package:real_state/features/main/presentation/widgets/main/real_estate_news_section.dart';
import 'package:real_state/features/main/presentation/widgets/main/what_do_you_want_section.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppbar(),
              const HomeSearchField(),
              const WhatDoYouWantSection(),
              const FeaturedPropertiesBrokersSection(),
              const RealEstateNewsBrokersSection(),
              const BrokersSection(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

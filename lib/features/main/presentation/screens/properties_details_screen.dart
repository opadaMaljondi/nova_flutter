import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main/presentation/widgets/benefits_and_services_property_details.dart';
import 'package:real_state/features/main/presentation/widgets/description.dart';
import 'package:real_state/features/main/presentation/widgets/details.dart';
import 'package:real_state/features/main/presentation/widgets/display_3d.dart';
import 'package:real_state/features/main/presentation/widgets/engineerinig_map.dart';
import 'package:real_state/features/main/presentation/widgets/location_on_map.dart';
import 'package:real_state/features/main/presentation/widgets/property_carousel_slider.dart';
import 'package:real_state/features/main/presentation/widgets/property_details_header.dart';
import 'package:real_state/features/main/presentation/widgets/rential_price.dart';
import 'package:real_state/features/main/presentation/widgets/sale_residential_investment.dart';
import 'package:real_state/features/main/presentation/widgets/show_video_on_youtube.dart';
import 'package:real_state/features/main/presentation/widgets/the_office.dart';

class PropertiesDetailsScreen extends StatelessWidget {
  const PropertiesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const PropertyCarouselSlider(),
              Container(
                margin: EdgeInsets.only(top: 300.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                  top: 20.h,
                  bottom: 138.h,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(30),
                    topStart: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PropertyDetailsHeader(),
                    const SaleResidentialInestment(),
                    SizedBox(
                      height: 25.h,
                    ),
                    const RentalPrice(),
                    SizedBox(
                      height: 22.h,
                    ),
                    const Details(),
                    SizedBox(
                      height: 22.h,
                    ),
                    const BenefitsAndServicesPropertyDetails(),
                    SizedBox(
                      height: 22.h,
                    ),
                    const Description(),
                    const LocationOnMap(),
                    SizedBox(
                      height: 22.h,
                    ),
                    const Display3D(),
                    SizedBox(
                      height: 22.h,
                    ),
                    const ShowVideoOnYoutube(),
                    SizedBox(
                      height: 30.h,
                    ),
                    const EngineerinigMap(),
                    SizedBox(
                      height: 22.h,
                    ),
                    const TheOffice(),
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

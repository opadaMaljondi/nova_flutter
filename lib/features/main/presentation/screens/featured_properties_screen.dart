import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/properties_card.dart';

class FeaturedPropertiesScreen extends StatelessWidget {
  const FeaturedPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(
                title: 'Featured properties',
              ),
              Divider(
                thickness: 0.3,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              SizedBox(
                height: 27.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        hintText: 'Search',
                        padding: EdgeInsets.zero,
                        fillColor: AppColors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.w,
                          color: AppColors.mainGray,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRoutes.filterShapeScreen,
                        );
                      },
                      child: SvgPicture.asset(
                        width: 50.w,
                        height: 50.h,
                        AppAssets.filters,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 27.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 11.h,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    return const PropertiesCard(isFavorite: true);
                  },
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

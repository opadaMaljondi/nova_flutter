import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/broker_card.dart';
import 'package:real_state/features/main/presentation/widgets/featured_properties_card.dart';
import 'package:real_state/features/main/presentation/widgets/properties_news_card.dart';
import 'package:real_state/features/main/presentation/widgets/shortcut_button.dart';
import 'package:real_state/features/main/presentation/widgets/title_header.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PrimaryIconButton(
                          icon: SvgPicture.asset(
                            AppAssets.profile,
                          ),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(50.r),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ahmad Nasser",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.primary,
                                  size: 15,
                                ),
                                Text(
                                  "Abo Daby",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        PrimaryIconButton(
                          icon: SvgPicture.asset(
                            AppAssets.support,
                          ),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(50.r),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        PrimaryIconButton(
                          icon: SvgPicture.asset(
                            AppAssets.notifications,
                          ),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(50.r),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                    SvgPicture.asset(
                      AppAssets.filters,
                    ),
                  ],
                ),
              ),
              const TitleHeader(title: "What do you want ?"),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShortcutButton(
                      iconPath: AppAssets.sell,
                      label: 'Sale',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                    ShortcutButton(
                      iconPath: AppAssets.rent,
                      label: 'Rent',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                    ShortcutButton(
                      iconPath: AppAssets.commercial,
                      label: 'Commercial',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                    ShortcutButton(
                      iconPath: AppAssets.apartments,
                      label: 'Apartments',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                  ],
                ),
              ),
              TitleHeader(
                title: "Featured Properties",
                onTap: () {},
              ),
              SizedBox(
                height: 300.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemCount: 10,
                  itemBuilder: (context, index) => const FeaturedPropertiesCard(),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 10.w,
                  ),
                ),
              ),
              TitleHeader(
                title: "Real Estate News",
                onTap: () {},
              ),
              SizedBox(
                height: 180.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemCount: 10,
                  itemBuilder: (context, index) => const FeaturedNewsCard(),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 10.w,
                  ),
                ),
              ),
              TitleHeader(
                title: "Brokers",
                onTap: () {},
              ),
              SizedBox(
                height: 200.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemCount: 10,
                  itemBuilder: (context, index) => const BrokerCard(
                    isCircle: true,
                  ),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 10.w,
                  ),
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

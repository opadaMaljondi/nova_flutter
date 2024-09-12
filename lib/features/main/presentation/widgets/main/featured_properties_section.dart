import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/properties_card.dart';
import 'package:real_state/features/main/presentation/widgets/title_header.dart';

class FeaturedPropertiesBrokersSection extends StatelessWidget {
  const FeaturedPropertiesBrokersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(
          title: LocaleKeys.featuredproperties.tr(),
          onTap: () {
            context.push(AppRoutes.featuredPropertiesScreen);
          },
        ),
        SizedBox(
          height: 300.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemCount: 10,
            itemBuilder: (context, index) => PropertiesCard(
              onTap: () {
                context.push(AppRoutes.propertiesDetails);
              },
              isFavorite: false,
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 10.w,
            ),
          ),
        ),
      ],
    );
  }
}

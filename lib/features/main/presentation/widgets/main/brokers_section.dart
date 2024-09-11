import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/broker_card.dart';
import 'package:real_state/features/main/presentation/widgets/title_header.dart';

class BrokersSection extends StatelessWidget {
  const BrokersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(
          title: LocaleKeys.borkers.tr(),
          onTap: () {
            context.push(AppRoutes.officesScreen);
          },
        ),
        SizedBox(
          height: 180.h,
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
      ],
    );
  }
}

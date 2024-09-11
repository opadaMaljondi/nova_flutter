import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/service_card.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  List<ServiceDataCard> items = [
    ServiceDataCard(
      title: LocaleKeys.engineeringCompanies.tr(),
      iconPath: AppAssets.engineeringCompanies,
    ),
    ServiceDataCard(
      title: LocaleKeys.realEstateCompanies.tr(),
      iconPath: AppAssets.realEstateCompanies,
    ),
    ServiceDataCard(
      title: LocaleKeys.contactRepresentative.tr(),
      iconPath: AppAssets.conectArepresentitve,
    ),
    ServiceDataCard(
      title: LocaleKeys.contactSupport.tr(),
      iconPath: AppAssets.contactSupport,
    ),
    ServiceDataCard(
      title: LocaleKeys.legalAdvisor.tr(),
      iconPath: AppAssets.legalAdvisor,
    ),
    ServiceDataCard(
      title: LocaleKeys.realEstateConsultant.tr(),
      iconPath: AppAssets.realEstateConsultant,
    ),
    ServiceDataCard(
      title: LocaleKeys.investmentAdvisor.tr(),
      iconPath: AppAssets.investmentAdvisor,
    ),
    ServiceDataCard(
      title: LocaleKeys.propertyMaintenance.tr(),
      iconPath: AppAssets.propertyMaintenance,
    ),
    ServiceDataCard(
      title: LocaleKeys.management.tr(),
      iconPath: AppAssets.management,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 50.h,
          horizontal: 20.w,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.9,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ServiceCard(
            title: items[index].title,
            iconPath: items[index].iconPath,
            onTap: () {
              if (index == 0 || index == 1) {
                context.push(AppRoutes.ebgineeringComapniesscreen);
              }
            },
          );
        },
      ),
    );
  }
}

class ServiceDataCard {
  final String title;
  final String iconPath;

  ServiceDataCard({
    required this.title,
    required this.iconPath,
  });
}

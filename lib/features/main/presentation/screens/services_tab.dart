import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/features/main/presentation/widgets/service_card.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  List<ServiceDataCard> items = [
    ServiceDataCard(
      title: 'Engineering companies',
      iconPath: AppAssets.engineeringCompanies,
    ),
    ServiceDataCard(
      title: 'Real estat companies',
      iconPath: AppAssets.realEstateCompanies,
    ),
    ServiceDataCard(
      title: 'Contact a representative',
      iconPath: AppAssets.conectArepresentitve,
    ),
    ServiceDataCard(
      title: 'Contact support',
      iconPath: AppAssets.contactSupport,
    ),
    ServiceDataCard(
      title: 'Legal advisor',
      iconPath: AppAssets.legalAdvisor,
    ),
    ServiceDataCard(
      title: 'Real estate consultant',
      iconPath: AppAssets.realEstateConsultant,
    ),
    ServiceDataCard(
      title: 'Investment dvisor',
      iconPath: AppAssets.investmentAdvisor,
    ),
    ServiceDataCard(
      title: 'Property maintenance',
      iconPath: AppAssets.propertyMaintenance,
    ),
    ServiceDataCard(
      title: 'Management',
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

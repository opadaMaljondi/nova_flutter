import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main/presentation/widgets/menu/menu_account_section.dart';
import 'package:real_state/features/main/presentation/widgets/menu/menu_appearance_section.dart';
import 'package:real_state/features/main/presentation/widgets/menu/menu_communication_section.dart';
import 'package:real_state/features/main/presentation/widgets/menu/menu_logout_and_version_section.dart';
import 'package:real_state/features/main/presentation/widgets/menu/menu_properties_section.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuPropertiesSection(),
              MenuCommunicationSection(),
              MenuAccountSection(),
              MenuAppearanceSection(),
              MenuLogoutAndVersionSection(),
            ],
          ),
        ),
      ),
    );
  }
}

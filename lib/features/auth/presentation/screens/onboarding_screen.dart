import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/services/router_service.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/auth/presentation/widgets/onboarding_button.dart';
import 'package:real_state/features/auth/presentation/widgets/onboarding_page1.dart';
import 'package:real_state/features/auth/presentation/widgets/onboarding_page2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary20,
              AppColors.primary20,
              AppColors.primary20,
              AppColors.primary10,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentTab = value;
                  });
                },
                children: const [
                  OnboardingPage1(),
                  OnboardingPage2(),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: OnboardingButton(
                  label: currentTab == 0 ? LocaleKeys.next.tr() : LocaleKeys.start.tr(),
                  onPressed: () {
                    if (currentTab == 0) {
                      setState(() {
                        controller.animateToPage(
                          ++currentTab,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      });
                    } else {
                      context.go(AppRoutes.signInScreen);
                      RouterService.setInitialRoute(AppRoutes.signInScreen);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

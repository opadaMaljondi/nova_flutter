import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/services/router_service.dart';

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
                children: [
                  Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          AppAssets.onboarding1,
                          width: 1.sw,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Image.asset(
                            AppAssets.logo,
                            width: 125.w,
                            height: 100.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
                            child: Text(
                              'Welcome to\n the world of distinguished real estate',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Here you can write anything related to this page.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          AppAssets.onboarding2,
                          width: 1.sw,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
                            child: Text(
                              'Welcome to\n the world of distinguished real estate',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Here you can write anything related to this page.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  child: MaterialButton(
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
                    disabledColor: AppColors.mainGray.withOpacity(0.5),
                    color: AppColors.materialPrimary.shade700.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.r),
                      side: const BorderSide(color: AppColors.primary20),
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            currentTab == 0 ? 'Next' : 'Start',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.double_arrow_rounded,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

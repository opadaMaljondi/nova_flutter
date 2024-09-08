import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_keys.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/services/caching_service.dart';
import 'package:real_state/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:real_state/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:real_state/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:real_state/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:real_state/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:real_state/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:real_state/features/main/presentation/screens/about_us.dart';
import 'package:real_state/features/main/presentation/screens/add_property_screen.dart';
import 'package:real_state/features/main/presentation/screens/company_info_screen.dart';
import 'package:real_state/features/main/presentation/screens/engineering_companies_screen.dart';
import 'package:real_state/features/main/presentation/screens/favorite_tab.dart';
import 'package:real_state/features/main/presentation/screens/featured_properties_screen.dart';
import 'package:real_state/features/main/presentation/screens/filter_screen.dart';
import 'package:real_state/features/main/presentation/screens/main_screen.dart';
import 'package:real_state/features/main/presentation/screens/news_screen.dart';
import 'package:real_state/features/main/presentation/screens/notifications_screen.dart';
import 'package:real_state/features/main/presentation/screens/offices_screen.dart';
import 'package:real_state/features/main/presentation/screens/properties_details.dart';
import 'package:real_state/features/main/presentation/screens/real_estate_screen.dart';
import 'package:real_state/features/main/presentation/screens/services_tab.dart';
import 'package:real_state/features/main/presentation/screens/trader_details_screen.dart';
import 'package:real_state/injection_container.dart';

class RouterService {
  final CacheService _cacheService;
  late GoRouter router;

  RouterService({required CacheService cacheService})
      : _cacheService = cacheService {
    String initialLocation = _cacheService.getData<String>(
          key: AppKeys.initialLocationRoute,
        ) ??
        AppRoutes.onBoardingScreen;
    router = GoRouter(
      routes: [
        //-------------------------------------------
        // Main Screens
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.mainScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MainScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.favoriteScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const FavoriteTab(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.officesScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const OfficesScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.newsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const NewsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        //-------------------------------------------
        // Authentication Screens
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.onBoardingScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.signInScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SignInScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.signUpScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SignUpScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.verificationCodeScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const VerificationCodeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.resetPasswordScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ResetPasswordScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.forgetPasswordScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ForgetPasswordScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.aboutUsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const AboutUsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.filterShapeScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const FilterScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.notificationsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const NotificationsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.servicesTab,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ServicesTab(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.ebgineeringComapniesscreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const EngineeringCompaniesScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.comapanyInfoScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const CompanyInfoScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.featuredPropertiesScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const FeaturedPropertiesScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.realEstateScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const RealEstateScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.propertiesDetails,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const PropertiesDetails(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.addPropertyScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const AddPropertyScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.traderDetailsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const TraderDetailsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
      ],
      initialLocation: initialLocation,
    );
  }

  static setInitialRoute(String route) {
    InjectionContainer.getIt<CacheService>().setData(
      key: AppKeys.initialLocationRoute,
      value: route,
    );
  }
}

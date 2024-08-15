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
import 'package:real_state/features/main/presentation/screens/favorite_tab.dart';
import 'package:real_state/features/main/presentation/screens/main_screen.dart';
import 'package:real_state/features/main/presentation/screens/news_screen.dart';
import 'package:real_state/features/main/presentation/screens/offices_screen.dart';
import 'package:real_state/injection_container.dart';

class RouterService {
  final CacheService _cacheService;
  late GoRouter router;

  RouterService({required CacheService cacheService}) : _cacheService = cacheService {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
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

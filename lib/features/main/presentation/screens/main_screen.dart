import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/widgets/primary_loader.dart';
import 'package:real_state/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:real_state/features/main/presentation/widgets/primary_bottom_navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        state.mapOrNull(
          logoutSuccess: (value) {
            context.go(AppRoutes.signInScreen);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Scaffold(
            body: PrimaryLoader(),
          ),
          orElse: () => Scaffold(
            body: PageView(
              controller: context.read<MainCubit>().mainScreenPageController,
              onPageChanged: context.read<MainCubit>().changeCurrentPage,
              physics: const NeverScrollableScrollPhysics(),
              children: context.read<MainCubit>().tabs,
            ),
            bottomNavigationBar: PrimaryBottomNavbar(
              currentTab: context.read<MainCubit>().currentTab,
              changeCurrentTab: context.read<MainCubit>().changeCurrentTab,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.add,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}

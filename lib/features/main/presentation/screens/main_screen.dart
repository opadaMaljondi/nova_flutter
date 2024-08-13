import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/widgets/primary_loader.dart';
import 'package:real_state/features/main/presentation/cubits/main_cubit/main_cubit.dart';

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
          orElse: () => const Scaffold(
              body: Center(
            child: Text('Main Screen'),
          )
              // PageView(
              //   controller: context.read<MainCubit>().mainScreenPageController,
              //   onPageChanged: context.read<MainCubit>().changeCurrentPage,
              //   children: context.read<MainCubit>().tabs,
              // ),
              // bottomNavigationBar: PrimaryBottomNavbar(
              //   currentTab: context.read<MainCubit>().currentTab,
              //   changeCurrentTab: context.read<MainCubit>().changeCurrentTab,
              // ),
              ),
        );
      },
    );
  }
}

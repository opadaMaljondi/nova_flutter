import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/features/main/presentation/screens/home_tab.dart';
import 'package:real_state/features/main/presentation/screens/map_tab.dart';
import 'package:real_state/features/main/presentation/screens/menu_tab.dart';
import 'package:real_state/features/main/presentation/screens/services_tab.dart';

import '../../../../../core/translations/local_keys.g.dart';

part 'main_cubit.freezed.dart';

part 'main_state.dart';

int filterIndex = 0;

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  /// Use Cases
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();
  final PageController mainScreenPageController = PageController();

  /// Data
  ThemeMode currentThemeMode = ThemeMode.system;
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const Center(
      child: Text('Empty'),
    ),
    const ServicesTab(),
    const MenuTab(),
  ];


  List<String> filterTypes = [
    LocaleKeys.showAll.tr(),
    LocaleKeys.rented.tr(),
    LocaleKeys.notRented.tr(),
    LocaleKeys.forSale.tr(),
    LocaleKeys.sale.tr(),
  ];

  /// variables
  int currentTab = 0;

  void changeCurrentTab(int index) {
    if (index != 2) {
      _update(const MainState.loading());
      currentTab = index;
      mainScreenPageController.animateToPage(
        currentTab,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeIn,
      );
      _update(const MainState.changeTabSuccess());
    }
  }

  void changeCurrentPage(int index) {
    _update(const MainState.loading());
    currentTab = index;
    _update(const MainState.changeTabSuccess());
  }

  selectFilter(int id) {
    _update(const MainState.loading());
    filterIndex = id;
    _update(const MainState.changeTabSuccess());
  }

  void _update(MainState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

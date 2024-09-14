import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/news/domain/entities/news_entity.dart';
import 'package:real_state/features/news/domain/usecases/get_feature_use_case.dart';
import 'package:real_state/injection_container.dart';

part 'get_news_cubit.freezed.dart';
part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(const GetNewsState.initial());

  /// Use Cases
  final GetNewsUseCase getNewsUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();

  /// Data
  List<News> news = [];

  /// variables

  /// functions
  Future<void> getNews() async {
    InjectionContainer.getIt<Logger>().i("Start `getNews` in |GetNewsCubit|");
    _update(
      const GetNewsState.loading(),
    );
    generalState = GeneralStates.loading;
    var result = await getNewsUseCase.call();
    result.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(
          GetNewsState.error(l.message),
        );
      },
      (r) {
        news = r;
        _update(
          const GetNewsState.loaded(),
        );
        generalState = GeneralStates.success;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getNews` in |GetNewsCubit| General State:$generalState",
    );
  }

  void _update(GetNewsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

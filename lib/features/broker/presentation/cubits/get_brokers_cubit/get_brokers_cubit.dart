import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
import 'package:real_state/features/broker/domain/usecases/get_brokers_use_case.dart';
import 'package:real_state/injection_container.dart';


part 'get_brokers_cubit.freezed.dart';
part 'get_brokers_state.dart';

class GetBrokersCubit extends Cubit<GetBrokersState> {
  GetBrokersCubit() : super(const GetBrokersState.initial());

  /// Use Cases
  final GetBrokersUseCase getBrokersUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();

  /// Data
  List<User> brokers = [];

  /// variables

  /// functions
  Future<void> getBorkers() async {
    InjectionContainer.getIt<Logger>().i("Start `getBorkers` in |GetBrokersCubit|");
    _update(const GetBrokersState.loading(),);
    generalState = GeneralStates.loading;
    var result = await getBrokersUseCase.call();
    result.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(GetBrokersState.error(l.message),);
      },
      (r) {
        brokers = r;
        _update(const GetBrokersState.loaded(),);
        generalState = GeneralStates.success;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getBorkers` in |GetBrokersCubit| General State:$generalState",
    );
  }

  void _update(GetBrokersState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/features/auth/domain/usecases/sign_up_with_whatsapp_use_case.dart';
import 'package:real_state/injection_container.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());

  /// Use Cases
  final SignUpWithWhatsappUseCase signUpWithWhatsappUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();

  /// Data

  /// variables

  /// functions
  Future<void> signUpWithWhatsapp() async {
    InjectionContainer.getIt<Logger>().i("Start `signUpWithWhatsapp` in |SignUpCubit|");
    // _update(const SignUpState.loading());
    generalState = GeneralStates.loading;
    await signUpWithWhatsappUseCase(
      onReceiveResult: (user, errorMessage) {
        if (errorMessage != null) {
          //user != null && user.user != null
          generalState = GeneralStates.success;
          _update(const SignUpState.loaded());
        } else {
          generalState = GeneralStates.badRequest;
          _update(SignUpState.error(errorMessage ?? 'Failed'));
        }
        InjectionContainer.getIt<Logger>().w(
          "End `signUpWithWhatsapp` in |SignUpCubit| General State:$generalState",
        );
      },
    );
  }

  void _update(SignUpState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

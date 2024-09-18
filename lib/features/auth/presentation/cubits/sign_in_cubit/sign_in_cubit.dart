import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_keys.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/core/services/caching_service.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:real_state/injection_container.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());

  /// Use Cases
  final SignInUseCase signInUseCase = InjectionContainer.getIt();
  final CacheService cacheService = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  /// functions
  Future<void> signIn() async {
    InjectionContainer.getIt<Logger>().i(
      "Start `signIn` in |SignInCubit|",
    );
    _update(
      const SignInState.loading(),
    );
    generalState = GeneralStates.loading;
    var resulte = await signInUseCase.call(
      password: passwordController.text,
      number: emailController.text,
    );
    resulte.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(
          SignInState.error(l.message),
        );
      },
      (r) {
        print('tokeen=======================================$r');
        generalState = GeneralStates.success;
        cacheService.setData(
          key: AppKeys.accessToken,
          value: r,
        );
        _update(
          const SignInState.loaded(),
        );
      },
    );
    InjectionContainer.getIt<Logger>().i(
      "End `signIn` in |SignInCubit|",
    );
  }

  void _update(SignInState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

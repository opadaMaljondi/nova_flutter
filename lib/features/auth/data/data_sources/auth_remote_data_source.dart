import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/core/services/otp_less_service.dart';
import 'package:real_state/features/auth/data/models/authenticated_user_model.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';
import 'package:real_state/injection_container.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> signUpWithWhatsapp({
    required void Function(AuthenticatedUserModel? user, String? errorMessage) onReceiveResult,
  });

  Future<Unit> signUp({
    required UserModel user,
    required String token,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;
  final OtpLessService otpLessService;

  AuthRemoteDataSourceImpl({required this.apiService, required this.otpLessService});

  @override
  Future<Unit> signUpWithWhatsapp({
    required void Function(AuthenticatedUserModel? user, String? errorMessage) onReceiveResult,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `signUpWithWhatsapp` in |AuthRemoteDataSourceImpl|",
      );
      await otpLessService.signUpWithWhatsapp(
        onReceiveResult: (token, errorMessage) async {
          if (token != null) {
            // final mapData = await apiService.post(
            //   subUrl: AppEndpoints.getUser,
            //   needToken: false,
            //   data: {'token': token},
            // );
            AuthenticatedUserModel? user;
            // user = AuthenticatedUserModel.fromJson(mapData!['data']);
            InjectionContainer.getIt<Logger>().w(
              "End `signUpWithWhatsapp` in |AuthRemoteDataSourceImpl| $token: token errorMessage: $errorMessage",
            );
            onReceiveResult(user, errorMessage);
          }
        },
      );
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `signUpWithWhatsapp` in |AuthRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<Unit> signUp({
    required UserModel user,
    required String token,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `signUpWithWhatsapp` in |AuthRemoteDataSourceImpl|",
      );
      await apiService.post(
        subUrl: AppEndpoints.getUser,
        data: {
          ...user.toJson(),
          'token': token,
        },
      );
      InjectionContainer.getIt<Logger>().w(
        "End `signUpWithWhatsapp` in |AuthRemoteDataSourceImpl|",
      );
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `signUpWithWhatsapp` in |AuthRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}

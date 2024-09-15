import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/core/services/otp_less_service.dart';
import 'package:real_state/features/auth/data/models/authenticated_user_model.dart';
import 'package:real_state/injection_container.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> signInWithWhatsapp({
    required void Function(AuthenticatedUserModel? user, String? errorMessage) onReceiveResult,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;
  final OtpLessService otpLessService;

  AuthRemoteDataSourceImpl({required this.apiService, required this.otpLessService});

  @override
  Future<Unit> signInWithWhatsapp({
    required void Function(AuthenticatedUserModel? user, String? errorMessage) onReceiveResult,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `signInWithWhatsapp` in |AuthRemoteDataSourceImpl|",
      );
      await otpLessService.signInWithWhatsApp(
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
              "End `signInWithWhatsapp` in |AuthRemoteDataSourceImpl| $token: token errorMessage: $errorMessage",
            );
            onReceiveResult(user, errorMessage);
          }
        },
      );
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `signInWithWhatsapp` in |AuthRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}

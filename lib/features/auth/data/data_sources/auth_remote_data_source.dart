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
    required void Function(AuthenticatedUserModel? user, String? errorMessage)
        onReceiveResult,
  });

  Future<Unit> signUp({
    required UserModel user,
    required String token,
  });

  Future<String> signIn({
    required String password,
    required String number,
  });

  Future<String> resetPassword({
    required String password,
    required String number,
    required String userToken,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;
  final OtpLessService otpLessService;

  AuthRemoteDataSourceImpl(
      {required this.apiService, required this.otpLessService});

  @override
  Future<Unit> signUpWithWhatsapp({
    required void Function(AuthenticatedUserModel? user, String? errorMessage)
        onReceiveResult,
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

  @override
  Future<String> signIn({
    required String password,
    required String number,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `signIn` in |AuthRemoteDataSourceImpl|",
      );
      final mapData = await apiService.post(
        subUrl: AppEndpoints.signIn,
        data: {
          'number': number,
          'password': password,
        },
      );
      final token = mapData['token'];
      return Future.value(token);
    } catch (e, s) {
      print('e ===================================================$e');
      InjectionContainer.getIt<Logger>().e(
        "End `signIn` in |AuthRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<String> resetPassword({
    required String password,
    required String number,
    required String userToken,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `resetPassword` in |AuthRemoteDataSourceImpl|",
      );
      final mapData = await apiService.put(
        subUrl: AppEndpoints.resetPassword,
        data: {
          'password': password,
          'number': number,
          'token': userToken,
        },
      );
      final token = mapData['token'];
      return Future.value(token);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `resetPassword` in |AuthRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}

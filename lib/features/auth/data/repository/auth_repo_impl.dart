import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:real_state/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:real_state/features/auth/domain/repository/auth_repo.dart';
import 'package:real_state/injection_container.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> signInWithWhatsapp({
    required void Function(AuthenticatedUser? user, String? errorMessage) onReceiveResult,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `signInWithWhatsapp` in |AuthRepoImpl|");
      await authRemoteDataSource.signInWithWhatsapp(
        onReceiveResult: (user, errorMessage) {
          // authLocalDataSource.setUser(userAuthModel: user);
          InjectionContainer.getIt<Logger>().w("End `signInWithWhatsapp` in |AuthRepoImpl|");
          onReceiveResult(user, errorMessage);
        },
      );
      return const Right(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `signInWithWhatsapp` in |AuthRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(StateManagerService.getFailureFromException(e));
    }
  }
}
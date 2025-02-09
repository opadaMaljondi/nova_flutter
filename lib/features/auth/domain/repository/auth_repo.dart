import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/entities/authenticated_user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> signUpWithWhatsapp({
    required void Function(AuthenticatedUser? user, String? errorMessage)
        onReceiveResult,
  });
  Future<Either<Failure, String>> signIn({
    required String password,
    required String number,
  });
  Future<Either<Failure, String>> resetPassword({
    required String number,
    required String password,
    required String userToken,
  });
}

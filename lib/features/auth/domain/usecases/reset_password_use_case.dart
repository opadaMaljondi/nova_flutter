import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/repository/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo authRepo;

  ResetPasswordUseCase({required this.authRepo});

  Future<Either<Failure, String>> call({
    required String number,
    required String password,
    required String userToken,
  }) async {
    return authRepo.resetPassword(
      number: number,
      password: password,
      userToken: userToken,
    );
  }
}

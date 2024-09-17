import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/repository/auth_repo.dart';

class SignInUseCase {
  final AuthRepo authRepo;

  SignInUseCase({required this.authRepo});

  Future<Either<Failure, String>> call({
    required String password,
    required String name,
  }) async {
    return authRepo.signIn(
      password: password,
      name: name,
    );
  }
}

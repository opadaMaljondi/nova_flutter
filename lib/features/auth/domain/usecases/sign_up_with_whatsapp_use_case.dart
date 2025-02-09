import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/entities/authenticated_user_entity.dart';
import 'package:real_state/features/auth/domain/repository/auth_repo.dart';

class SignUpWithWhatsappUseCase {
  final AuthRepo authRepo;

  SignUpWithWhatsappUseCase({required this.authRepo});

  Future<Either<Failure, Unit>> call({
    required void Function(AuthenticatedUser? user, String? errorMessage) onReceiveResult,
  }) async {
    return await authRepo.signUpWithWhatsapp(onReceiveResult: onReceiveResult);
  }
}

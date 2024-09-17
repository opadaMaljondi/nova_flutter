import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';

class GetUserUseCase {
  final MainRepo mainRepo;

  GetUserUseCase({required this.mainRepo});

  Future<Either<Failure, User>> call() async {
    return await mainRepo.getUser();
  }
}

import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';

class LogoutUseCase {
  final MainRepo mainRepo;

  LogoutUseCase({required this.mainRepo});
  Future<Either<Failure, Unit>> call() async {
    return await mainRepo.logOut();
  }
}

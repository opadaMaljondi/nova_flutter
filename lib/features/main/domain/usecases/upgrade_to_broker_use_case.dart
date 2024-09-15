import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';

class UpgradeToBrokerUseCase {
  final MainRepo mainRepo;

  UpgradeToBrokerUseCase({required this.mainRepo});

  Future<Either<Failure, Unit>> upgradeToBroker() async {
    return await mainRepo.upgradeToBroker();
  }
}

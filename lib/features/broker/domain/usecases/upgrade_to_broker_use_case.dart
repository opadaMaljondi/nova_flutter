import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/broker/domain/repository/broker_repo.dart';

class UpgradeToBrokerUseCase {
  final BrokerRepo brokerRepo;

  UpgradeToBrokerUseCase({required this.brokerRepo});

  Future<Either<Failure, Unit>> upgradeToBroker() async {
    return await brokerRepo.upgradeToBroker();
  }
}

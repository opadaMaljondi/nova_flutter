import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
import 'package:real_state/features/broker/domain/repository/broker_repo.dart';

class GetBrokersUseCase {
  final BrokerRepo brokerRepo;

  GetBrokersUseCase({required this.brokerRepo});

  Future<Either<Failure, List<User>>> call({String? name}) async {
    return await brokerRepo.getBrokers();
  }
}

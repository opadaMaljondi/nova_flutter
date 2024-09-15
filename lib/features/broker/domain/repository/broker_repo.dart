import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';

abstract class BrokerRepo {
  Future<Either<Failure, List<User>>> getBrokers({
    String name,
  });
  Future<Either<Failure, Unit>> upgradeToBroker();
}

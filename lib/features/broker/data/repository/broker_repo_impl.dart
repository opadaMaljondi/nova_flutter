import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
import 'package:real_state/features/broker/data/data_sources/broker_remote_data_source.dart';
import 'package:real_state/features/broker/domain/repository/broker_repo.dart';
import 'package:real_state/injection_container.dart';

class BrokerRepoImpl implements BrokerRepo {
  final BrokerRemoteDataSource brokerRemoteDataSource;

  const BrokerRepoImpl({required this.brokerRemoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getBrokers({String? name}) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getBrokers` in |BrokerRepoImpl|",
      );
      final brokers = await brokerRemoteDataSource.getBrokers();
      InjectionContainer.getIt<Logger>().w(
        "End `getBrokers` in |BrokerRepoImpl|",
      );
      return Right(brokers);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getBrokers` in |BrokerRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> upgradeToBroker() async { 
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `upgradeToBroker` in |MainRepoImpl|",
      );
      await brokerRemoteDataSource.upgradeToBroker();
      InjectionContainer.getIt<Logger>().w(
        "End `upgradeToBroker` in |MainRepoImpl|",
      );
      return const Right(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `upgradeToBroker` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }
}

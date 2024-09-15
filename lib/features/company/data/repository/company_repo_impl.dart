import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/company/data/data_sources/company_remote_data_source.dart';
import 'package:real_state/features/company/domain/entities/company_entity.dart';
import 'package:real_state/features/company/domain/repository/company_repo.dart';
import 'package:real_state/injection_container.dart';

class CompanyRepoImpl implements CompanyRepo {
  final CompanyRemoteDataSource companyRemoteDataSource;

  const CompanyRepoImpl({required this.companyRemoteDataSource});

  @override
  Future<Either<Failure, List<Company>>> getCompanies() async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `getCompanies` in |CompanyRepoImpl|");
      var companies = await companyRemoteDataSource.getCompanies();
      InjectionContainer.getIt<Logger>()
          .w("End `getCompanies` in |CompanyRepoImpl|");
      return Right(companies);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getCompanies` in |CompanyRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }
}

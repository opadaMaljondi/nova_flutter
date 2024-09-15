import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/company/domain/entities/company_entity.dart';
import 'package:real_state/features/company/domain/repository/company_repo.dart';

class GetCompaniesUseCase {
  final CompanyRepo companyRepo;

  GetCompaniesUseCase({required this.companyRepo});

  Future<Either<Failure, List<Company>>> call() async {
    return await companyRepo.getCompanies();
  }
}

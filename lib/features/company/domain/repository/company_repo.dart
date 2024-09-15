import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/company/domain/entities/company_entity.dart';

abstract class CompanyRepo {
  Future<Either<Failure, List<Company>>> getCompanies();
}

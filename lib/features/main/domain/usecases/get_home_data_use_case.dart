import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/main/domain/entities/home_data_entity.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';

class GetHomeDataUseCase {
  final MainRepo mainRepo;

  GetHomeDataUseCase({required this.mainRepo});

  Future<Either<Failure, HomeData>> call() async {
    return await mainRepo.getHome();
  }
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';

class UpdateProfileUseCase {
  final MainRepo mainRepo;

  UpdateProfileUseCase({required this.mainRepo});
  Future<Either<Failure, User>> call({
    required UserModel userModel,
    required File? photo,
  }) async {
    return await mainRepo.updateProfile(
      userModel: userModel,
      photo: photo,
    );
  }
}

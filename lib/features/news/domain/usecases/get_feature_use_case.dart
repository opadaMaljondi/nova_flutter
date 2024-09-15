import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/news/domain/entities/news_entity.dart';
import 'package:real_state/features/news/domain/repository/news_repo.dart';

class GetNewsUseCase {
  final NewsRepo newsRepo;

  GetNewsUseCase({required this.newsRepo});

  Future<Either<Failure, List<News>>> call() async {
    return await newsRepo.getNews();
  }
}

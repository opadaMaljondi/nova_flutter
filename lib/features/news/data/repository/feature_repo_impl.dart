import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:real_state/features/news/domain/entities/news_entity.dart';
import 'package:real_state/features/news/domain/repository/news_repo.dart';
import 'package:real_state/injection_container.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource newsRemoteDataSource;

  const NewsRepoImpl({required this.newsRemoteDataSource});

  @override
  Future<Either<Failure, List<News>>> getNews() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getNews` in |NewsRepoImpl|",
      );
      var news = await newsRemoteDataSource.getNews();
      InjectionContainer.getIt<Logger>().w(
        "End `getNews` in |NewsRepoImpl|",
      );
      return Right(news);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getNews` in |NewsRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }
}

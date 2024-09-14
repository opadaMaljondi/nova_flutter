import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/news/domain/entities/news_entity.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<News>>> getNews();
}

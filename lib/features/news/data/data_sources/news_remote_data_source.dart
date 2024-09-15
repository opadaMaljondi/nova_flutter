import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/features/news/data/models/news_model.dart';
import 'package:real_state/injection_container.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final ApiService apiService;

  NewsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `getNews` in |NewsRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getNews,
      );
      final news = mapData['news'].map((e) => NewsModel.fromJson(e)).toList();

      InjectionContainer.getIt<Logger>()
          .w("End `getNews` in |NewsRemoteDataSourceImpl|");
      return Future.value(news);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getNews` in |NewsRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}

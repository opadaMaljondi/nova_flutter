import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/features/company/data/models/company_model.dart';
import 'package:real_state/injection_container.dart';

abstract class CompanyRemoteDataSource {
  Future<List<CompanyModel>> getCompanies();
}

class CompanyRemoteDataSourceImpl extends CompanyRemoteDataSource {
  final ApiService apiService;

  CompanyRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `getCompanies` in |CompanyRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getCompanies,
      );
      final companies =
          mapData['companies'].map((e) => CompanyModel.fromJson(e)).toList();

      InjectionContainer.getIt<Logger>()
          .w("End `getCompanies` in |CompanyRemoteDataSourceImpl|");
      return Future.value(companies);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getCompanies` in |CompanyRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}

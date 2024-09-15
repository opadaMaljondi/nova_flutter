part of 'get_companies_cubit.dart';

@freezed
class GetCompaniesState with _$GetCompaniesState {
  const factory GetCompaniesState.initial() = _Initial;

  const factory GetCompaniesState.loading() = _Loading;

  const factory GetCompaniesState.loaded() = _Loaded;

  const factory GetCompaniesState.componentChanged() = _ComponentChanged;

  const factory GetCompaniesState.error(String message) = _Error;
}

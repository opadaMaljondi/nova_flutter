part of 'get_news_cubit.dart';

@freezed
class GetNewsState with _$GetNewsState {
  const factory GetNewsState.initial() = _Initial;

  const factory GetNewsState.loading() = _Loading;

  const factory GetNewsState.loaded() = _Loaded;

  const factory GetNewsState.componentChanged() = _ComponentChanged;

  const factory GetNewsState.error(String message) = _Error;
}

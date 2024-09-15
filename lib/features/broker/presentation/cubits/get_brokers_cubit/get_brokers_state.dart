part of 'get_brokers_cubit.dart';



@freezed
class GetBrokersState with _$GetBrokersState {
  const factory GetBrokersState.initial() = _Initial;

  const factory GetBrokersState.loading() = _Loading;

  const factory GetBrokersState.loaded() = _Loaded;

  const factory GetBrokersState.componentChanged() = _ComponentChanged;

  const factory GetBrokersState.error(String message) = _Error;
}

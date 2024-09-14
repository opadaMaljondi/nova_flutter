import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/company/domain/usecases/add_favorite_use_case.dart';
import 'package:real_state/features/company/presentation/cubits/favorites_cubit/favorite_state.dart';
import 'package:real_state/injection_container.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState.initial());
  // Use Cases
  AddFavoriteUseCase addFavoriteUseCase = InjectionContainer.getIt();
  AddFavoriteUseCase removeFavoriteUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  // Functions
  Future<void> addFavorite({required int id}) async {
    InjectionContainer.getIt<Logger>()
        .i("Start `addFavorite` in |FavoriteCubit|");
    _update(
      const FavoriteState.loading(),
    );
    generalState = GeneralStates.loading;
    var resulte = await addFavoriteUseCase.call(id: id);

    resulte.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(
          FavoriteState.error(l.message),
        );
      },
      (r) {
        _update(
          const FavoriteState.loaded(),
        );
        generalState = GeneralStates.success;
      },
    );
    InjectionContainer.getIt<Logger>()
        .i("End `addFavorite` in |FavoriteCubit|");
  }

  Future<void> removeFavorite({required int id}) async {
    InjectionContainer.getIt<Logger>()
        .i("Start `removeFavorite` in |FavoriteCubit|");
    _update(
      const FavoriteState.loading(),
    );
    generalState = GeneralStates.loading;
    var resulte = await removeFavoriteUseCase.call(id: id);

    resulte.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(
          FavoriteState.error(l.message),
        );
      },
      (r) {
        _update(
          const FavoriteState.loaded(),
        );
        generalState = GeneralStates.success;
      },
    );
    InjectionContainer.getIt<Logger>()
        .i("End `removeFavorite` in |FavoriteCubit|");
  }

  void _update(FavoriteState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

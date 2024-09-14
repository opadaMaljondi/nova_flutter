import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/company/domain/entities/company_entity.dart';
import 'package:real_state/features/company/domain/usecases/get_companies_use_case.dart';
import 'package:real_state/injection_container.dart';

part 'get_companies_cubit.freezed.dart';
part 'get_companies_state.dart';

class GetCompaniesCubit extends Cubit<GetCompaniesState> {
  GetCompaniesCubit() : super(const GetCompaniesState.initial());

  /// Use Cases
  final GetCompaniesUseCase getCompaniesUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Data
  List<Company> companies = [];

  /// functions
  Future<void> getCompanies() async {
    InjectionContainer.getIt<Logger>()
        .i("Start `getCompanies` in |CompaniesCubit|");
    _update(
      const GetCompaniesState.loading(),
    );
    generalState = GeneralStates.loading;
    var result = await getCompaniesUseCase.call();
    result.fold(
      (l) {
        generalState = StateManagerService.getStateFromFailure(l);
        _update(
          GetCompaniesState.error(l.message),
        );
      },
      (r) {
        companies = r;
        _update(
          const GetCompaniesState.loaded(),
        );
        generalState = GeneralStates.success;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getCompanies` in |CompaniesCubit| General State:$generalState",
    );
  }

  void _update(GetCompaniesState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

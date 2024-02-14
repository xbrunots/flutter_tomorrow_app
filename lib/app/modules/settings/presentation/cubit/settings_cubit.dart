import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suamusica_weather/app/modules/settings/presentation/cubit/states/clear_cache_state.dart';

import '../../../../shared/dark_mode/domain/usecases/usecases.dart';
import '../../domain/usecases/usecases.dart';
import 'states/states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.setDarkModeUseCase, this.getDarkModeUseCase, this.clearCacheUseCase) : super(InitializeState());

  final SetDarkModeUseCase setDarkModeUseCase;
  final GetDarkModeUseCase getDarkModeUseCase;
  final ClearCacheUseCase clearCacheUseCase;

  Future<void> get() async {
    emit(LoadingState());

    final result = await getDarkModeUseCase();
    result.get(
      (error) => emit(ErrorState(error: error.errorMessage)),
      (success) {
        emit(DarkModeState(darkMode: success));
      },
    );
  }

  Future<void> clearCache() async {
    emit(LoadingState());

    final result = await clearCacheUseCase();
    result.get(
      (error) => emit(ErrorState(error: error.errorMessage)),
      (success) {
        emit(ClearCacheState());
      },
    );
  }

  Future<void> set(bool enable) async {
    emit(LoadingState());

    final result = await setDarkModeUseCase(enable: enable);
    result.get(
      (error) => emit(ErrorState(error: error.errorMessage)),
      (success) {
        emit(DarkModeState(darkMode: enable));
        emit(ResetUIState());
      },
    );
  }
}

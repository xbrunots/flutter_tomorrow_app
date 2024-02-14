import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suamusica_weather/app/shared/shared.dart';

import '../../../../shared/dark_mode/domain/usecases/usecases.dart';
import 'states/states.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this.setDarkModeUseCase,
    this.getDarkModeUseCase,
  ) : super(InitializeState());

  final SetDarkModeUseCase setDarkModeUseCase;
  final GetDarkModeUseCase getDarkModeUseCase;

  Future<void> init() async {
    await get();
    await navigate();
  }

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

  Future<void> navigate() async {
    emit(LoadingState());
    await Future.delayed(3000.ms);
    emit(NavigateHomeState());
  }

  Future<void> set(bool enable) async {
    emit(LoadingState());

    final result = await setDarkModeUseCase(enable: enable);
    result.get(
      (error) => emit(ErrorState(error: error.errorMessage)),
      (success) {
        emit(DarkModeState(darkMode: enable));
      },
    );
  }
}

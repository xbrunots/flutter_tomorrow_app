import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:suamusica_weather/app/modules/home/presentation/cubit/states/home_state.dart';
import 'package:suamusica_weather/app/modules/home/presentation/ui/utils/home_strings.dart';
import 'package:suamusica_weather/app/shared/http_client/core/either/either.dart';

import '../../domain/usecases/usecases.dart';

class HomeCubit extends Cubit<HomeStates> {
  final ForecastWeekUseCase forecastWeekUseCase;
  final ForecastRealtimeUseCase forecastRealtimeUseCase;
  final ForecastIntraDayUseCase forecastIntraDayUseCase;
  final SetLocationUseCase setLocationUseCase;
  final GetLocationUseCase getLocationUseCase;

  HomeCubit(
    this.forecastWeekUseCase,
    this.forecastRealtimeUseCase,
    this.forecastIntraDayUseCase,
    this.setLocationUseCase,
    this.getLocationUseCase,
  ) : super(HomeStates.loading());

  Future<void> setCurrentLocal(String location) async {
    await setLocationUseCase.call(location: location);
    await init();
  }

  Future<void> requestPermission() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    var status = await Permission.location.request();
    if (!status.isGranted) {
      var request = await Permission.location.request();
      if (!request.isGranted) {
        emit(state.copyWith(
          error: HomeStrings.permissionDenied,
          isLoading: false,
          currentLocal: null,
        ));
        return null;
      }
    }

    await updatePosition();
  }

  updatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> place =
        await placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: 'pt_BR');
    if (place.first.subAdministrativeArea != null) {
      await setCurrentLocal(place.first.subAdministrativeArea!);
      init();
    }
  }

  Future<void> init() async {
    final result = await getLocationUseCase.call();
    String? location;

    if (result is Success) {
      location = result.toSuccess();
    }

    await getRealtime(location: location);
    await getForecastIntraDay(location: location);
    await getForecastWeek(location: location);
  }

  Future<void> getRealtime({String? location}) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    if (location == null && state.currentLocal == null) {
      emit(state.copyWith(
        isLoading: false,
        currentLocal: null,
      ));
      return;
    }

    final result = await forecastRealtimeUseCase.call(
      location: location ?? state.currentLocal!,
    );

    result.get(
      (error) => emit(state.copyWith(
        error: error.errorMessage,
        isLoading: false,
        currentLocal: null,
      )),
      (success) {
        emit(state.copyWith(
          realtimeEntity: success,
          isLoading: false,
          currentLocal: location,
        ));
      },
    );
  }

  Future<void> getLocation({String? location}) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    if (location == null && state.currentLocal == null) {
      emit(state.copyWith(
        isLoading: false,
        currentLocal: null,
      ));
      return;
    }

    final result = await forecastWeekUseCase.call(
      location: location ?? state.currentLocal!,
    );
    result.get(
      (error) => emit(state.copyWith(
        error: error.errorMessage,
        isLoading: false,
        currentLocal: null,
      )),
      (success) {
        emit(state.copyWith(
          weekList: success,
          isLoading: false,
          currentLocal: location,
        ));
      },
    );
  }

  Future<void> getForecastWeek({String? location}) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    if (location == null && state.currentLocal == null) {
      emit(state.copyWith(
        isLoading: false,
        currentLocal: null,
      ));
      return;
    }

    final result = await forecastWeekUseCase.call(
      location: location ?? state.currentLocal!,
    );
    result.get(
      (error) => emit(state.copyWith(
        error: error.errorMessage,
        isLoading: false,
        currentLocal: null,
      )),
      (success) {
        emit(state.copyWith(
          weekList: success,
          isLoading: false,
          currentLocal: location,
        ));
      },
    );
  }

  Future<void> getForecastIntraDay({String? location}) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    if (location == null && state.currentLocal == null) {
      emit(state.copyWith(
        isLoading: false,
        currentLocal: null,
      ));
      return;
    }

    final result = await forecastIntraDayUseCase.call(
      location: location ?? state.currentLocal!,
    );
    result.get(
      (error) => emit(state.copyWith(
        error: error.errorMessage,
        isLoading: false,
        currentLocal: null,
      )),
      (success) {
        emit(state.copyWith(
          intraDayList: success,
          isLoading: false,
          currentLocal: location,
        ));
      },
    );
  }
}

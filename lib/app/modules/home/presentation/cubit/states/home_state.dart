import '../../../../../shared/cubit/state/states.dart';
import '../../../domain/entities/entities.dart';

class HomeStates implements GlobalStates {
  final List<WeatherWeekEntity> weekList;
  final List<WeatherIntraDayEntity> intraDayList;
  final RealtimeEntity realtimeEntity;
  final bool isLoading;
  final String? error;
  final String? currentLocal;

  const HomeStates({
    required this.weekList,
    required this.realtimeEntity,
    required this.isLoading,
    required this.intraDayList,
    this.error,
    this.currentLocal,
  });

  HomeStates copyWith({
    List<WeatherWeekEntity>? weekList,
    List<WeatherIntraDayEntity>? intraDayList,
    RealtimeEntity? realtimeEntity,
    bool? isLoading,
    String? error,
    String? currentLocal,
  }) {
    return HomeStates(
      realtimeEntity: realtimeEntity ?? this.realtimeEntity,
      intraDayList: intraDayList ?? this.intraDayList,
      weekList: weekList ?? this.weekList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentLocal: currentLocal ?? this.currentLocal,
    );
  }

  factory HomeStates.initialize() {
    return HomeStates(
      realtimeEntity: RealtimeEntity(),
      intraDayList: [],
      weekList: [],
      isLoading: false,
      currentLocal: null,
    );
  }

  factory HomeStates.loading() {
    return HomeStates(
      realtimeEntity: RealtimeEntity(),
      intraDayList: [],
      weekList: [],
      isLoading: true,
      currentLocal: null,
    );
  }
}

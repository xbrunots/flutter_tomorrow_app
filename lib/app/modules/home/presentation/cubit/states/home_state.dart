import '../../../../../shared/cubit/state/states.dart';
import '../../../domain/entities/entities.dart';

class HomeStates implements GlobalStates {
  final List<WeatherWeekEntity> weekList;
  final List<WeatherIntraDayEntity> intraDayList;
  final RealtimeEntity realtimeEntity;
  final bool isLoading;
  final bool? noLocal;
  final String? error;
  final String? currentLocal;

  const HomeStates({
    required this.weekList,
    required this.realtimeEntity,
    required this.isLoading,
    required this.intraDayList,
    this.error,
    this.currentLocal,
    this.noLocal,
  });

  HomeStates copyWith({
    List<WeatherWeekEntity>? weekList,
    List<WeatherIntraDayEntity>? intraDayList,
    RealtimeEntity? realtimeEntity,
    bool? isLoading,
    bool? noLocal,
    String? error,
    String? currentLocal,
  }) {
    return HomeStates(
      realtimeEntity: realtimeEntity ?? this.realtimeEntity,
      intraDayList: intraDayList ?? this.intraDayList,
      weekList: weekList ?? this.weekList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      noLocal: noLocal ?? this.noLocal,
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
      noLocal: null,
    );
  }

  factory HomeStates.noLocal() {
    return HomeStates(
      realtimeEntity: RealtimeEntity(),
      intraDayList: [],
      weekList: [],
      isLoading: false,
      currentLocal: null,
      noLocal: true,
    );
  }

  factory HomeStates.loading() {
    return HomeStates(
      realtimeEntity: RealtimeEntity(),
      intraDayList: [],
      weekList: [],
      isLoading: true,
      currentLocal: null,
      noLocal: null,
    );
  }
}

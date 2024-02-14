import 'states.dart';

class DarkModeState implements SettingsState {
  const DarkModeState({
    required this.darkMode,
  });

  final bool darkMode;

  DarkModeState copyWith({
    bool? darkMode,
  }) {
    return DarkModeState(
      darkMode: darkMode ?? this.darkMode,
    );
  }
}

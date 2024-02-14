import 'states.dart';

class ErrorState implements SettingsState {
  final String? error;

  const ErrorState({this.error});
}

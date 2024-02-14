import 'global_state.dart';

class ErrorState implements GlobalStates {
  final String message;
  const ErrorState(this.message);
}

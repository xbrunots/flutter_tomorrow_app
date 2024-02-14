import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/states.dart';

class AppCubit extends Cubit<GlobalStates> {
  AppCubit() : super(const LoadingState());

  Future<void> setUpApp() async {
    emit(const SuccessState());
  }
}

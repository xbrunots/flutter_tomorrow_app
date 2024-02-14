import '../../constants/constants.dart';

class AppError {
  final String errorMessage;

  AppError({this.errorMessage = AppStrings.defaultError});
}

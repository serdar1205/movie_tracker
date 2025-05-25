part of 'app_mode_bloc.dart';

sealed class AppModeState {}

final class AppModeInitial extends AppModeState {}
final class AppModeLoaded extends AppModeState {
  final AppModeModel data;

  AppModeLoaded(this.data);
}
final class AppModeError extends AppModeState {
  final String message;

  AppModeError(this.message);
}



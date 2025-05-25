import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/features/data/models/app_mode_model.dart';
import 'package:movie_tracker/features/data/repositories/app_mode_repository.dart';

part 'app_mode_event.dart';

part 'app_mode_state.dart';

class AppModeBloc extends Bloc<AppModeEvent, AppModeState> {
  final AppModeRepository repository;

  AppModeBloc(this.repository) : super(AppModeInitial()) {
    on<GetAppMode>((event, emit) async {
      await emit.forEach<AppModeLoaded>(
        repository.getModeStream().asyncMap((mode) async {
          final url = await repository.getProductionUrlStream().first;
          return AppModeLoaded(AppModeModel(mode: mode, productionUrl: url));
        }),
        onData: (data) => data,
        onError: (error, stackTrace) {
          if (error is FirebaseException) {
            return AppModeError("Firebase error: ${error.message}");
          } else {
            return AppModeError("Unknown error: ${error.toString()}");
          }
        },
      );

    });
  }
}

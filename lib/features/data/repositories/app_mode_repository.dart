import 'package:movie_tracker/features/data/datasources/remote/app_mode_remote_datasource.dart';

class AppModeRepository {
  final AppModeRemoteDatasource remoteDatasource;

  AppModeRepository(this.remoteDatasource);

  Stream<String> getModeStream() {
    return remoteDatasource.getModeStream();
  }

  Stream<String> getProductionUrlStream() {
    return remoteDatasource.getProductionUrlStream();
  }
}

import 'package:firebase_database/firebase_database.dart';

abstract class AppModeRemoteDatasource{
  Stream<String> getModeStream();
  Stream<String> getProductionUrlStream();
}

class AppModeRemoteDatasourceImpl extends AppModeRemoteDatasource{
  final FirebaseDatabase database;

  AppModeRemoteDatasourceImpl(this.database);

  @override
  Stream<String> getModeStream() {
    return database.ref('mode').onValue.map((e)=>e.snapshot.value.toString());
  }

  @override
  Stream<String> getProductionUrlStream() {
    return database.ref('production_url').onValue.map((e)=> e.snapshot.value.toString());
  }
}
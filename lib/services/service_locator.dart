import 'package:flutter_application_coded/services/storage/hive_storage_service.dart';
import 'package:flutter_application_coded/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Services
  // Storage
  serviceLocator.registerLazySingleton<StorageService>(
    () => HiveStorageService(),
  );
}

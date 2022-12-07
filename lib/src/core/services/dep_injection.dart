import 'package:get_it/get_it.dart';
import 'package:learning/src/modules/authentication/data_layer/data_sources/auth_remote_data_sources.dart';
import 'package:learning/src/modules/authentication/domain_layer/repsitories/base_auth_repository.dart';

import '../../modules/authentication/data_layer/repositories/auth_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() async {
    BaseAuthRemoteDataSource baseAuthRemoteDataSource = AuthRemoteDataSource();
    sl.registerLazySingleton(() => baseAuthRemoteDataSource);

    BaseAuthRepository baseAuthRepository = AuthRepository(sl());
    sl.registerLazySingleton(() => baseAuthRepository);
  }
}


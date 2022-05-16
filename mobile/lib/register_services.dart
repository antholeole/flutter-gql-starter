import 'package:get_it/get_it.dart';
import 'package:mobile/configs/base_config.dart';

import 'package:local_user/local_user.dart';

final getIt = GetIt.I;

void registerServices(Config config) {
  getIt.registerSingleton(LocalUser());
}

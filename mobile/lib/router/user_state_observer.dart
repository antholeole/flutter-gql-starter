import 'package:auto_route/auto_route.dart';
import 'package:local_user/local_user.dart';
import 'package:mobile/router/router.dart';

import '../register_services.dart';

class UserStateObserver extends AutoRouterObserver {
  final LocalUser _localUser = getIt<LocalUser>();
  final AppRouter _router;

  UserStateObserver(AppRouter router) : _router = router {
    _localUser.addListener(_didUpdateUserState);
    _localUser.determineState();
  }

  void _didUpdateUserState() {
    _router.popUntilRoot();
    _localUser.on(
      loading: () => _router.popAndPush(const SplashRoute()),
      loggedOut: (reason) => _router.popAndPush(const LoginRoute()),
      loggedIn: (userId) => _router.popAndPush(const HomeRoute()),
    );
  }
}

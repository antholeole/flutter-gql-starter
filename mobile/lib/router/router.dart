import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/pages/home/home_page.dart';
import 'package:mobile/pages/login/view/login_page.dart';
import 'package:mobile/pages/splash/splash_page.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: SplashPage,
      initial: true,
      transitionsBuilder: noAnimationTransition,
    ),
    CustomRoute(
      page: LoginPage,
      transitionsBuilder: noAnimationTransition,
    ),
    CustomRoute(
      page: HomePage,
      transitionsBuilder: noAnimationTransition,
    )
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

// public due to bug where private transitions don't work
Widget noAnimationTransition(
    BuildContext _, Animation<double> __, Animation<double> ___, Widget child) {
  return child;
}

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SplashPage(),
          transitionsBuilder: noAnimationTransition,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: WrappedRoute(child: const LoginPage()),
          transitionsBuilder: noAnimationTransition,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          transitionsBuilder: noAnimationTransition,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(HomeRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

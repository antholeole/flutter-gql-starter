import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/configs/base_config.dart';
import 'package:mobile/register_services.dart';
import 'package:mobile/router/router.dart';
import 'package:mobile/router/user_state_observer.dart';
import 'package:toaster_next/toaster/toaster_interface.dart';

Future<void> initalize(Config config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  registerServices(config);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => Toaster.mount(child: child!),
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [UserStateObserver(_appRouter)],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/theme/logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(child: Logo()),
    );
  }
}

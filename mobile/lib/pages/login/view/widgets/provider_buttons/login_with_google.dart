import 'package:flutter/material.dart';
import 'login_with_provider_button.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginWithProviderButton(
      bgColor: const Color(0xff4285F4),
      onTap: () {},
      providerName: 'Google',
    );
  }
}

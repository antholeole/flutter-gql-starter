import 'package:flutter/material.dart';

import 'login_with_provider_button.dart';

class LoginWithApple extends StatelessWidget {
  static const String name = 'Apple';

  const LoginWithApple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginWithProviderButton(
      bgColor: Colors.black,
      onTap: () {},
      providerName: name,
    );
  }
}

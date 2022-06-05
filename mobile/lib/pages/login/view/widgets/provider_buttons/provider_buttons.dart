import 'package:flutter/material.dart';
import 'package:mobile/pages/login/view/widgets/provider_buttons/login_with_apple.dart';

import 'login_with_google.dart';

class ProviderButtons extends StatelessWidget {
  const ProviderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [LoginWithGoogle(), LoginWithApple()],
    );
  }
}

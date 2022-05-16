import 'package:flutter/material.dart';
import 'package:toaster_next/toaster.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(
        child: Text('tap me'),
        onPressed: () =>
            Toaster.of(context).add(Toast(message: 'hi', type: errorToast)),
      )),
    );
  }
}

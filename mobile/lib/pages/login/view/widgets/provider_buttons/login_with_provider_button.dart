import 'package:flutter/material.dart';

class LoginWithProviderButton extends StatelessWidget {
  final Color bgColor;
  final String providerName;
  final VoidCallback onTap;

  const LoginWithProviderButton({
    Key? key,
    required this.bgColor,
    required this.providerName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: bgColor,
              padding: const EdgeInsets.all(15)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                  child: Image.asset(
                    'assets/provider_logos/${providerName.toLowerCase()}.png',
                    height: 40,
                  ),
                ),
                Container(
                  height: 35,
                  width: 2,
                  color: Colors.white60,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Sign in with $providerName',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

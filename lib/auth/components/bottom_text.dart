import 'package:flutter/material.dart';

import 'login_content.dart';
class BottomText extends StatelessWidget {
  final Screens screen;

  const BottomText(
      {super.key, required this.screen}
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: RichText(text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Fredoka',
          ),
          children: [
            TextSpan(
              text: screen == Screens.createAccount
                  ? '¿Ya tienes una cuenta?'
                  : '¿No tienes una cuenta?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )
            ),
            TextSpan(
              text: screen == Screens.createAccount
                  ? '  Iniciar Sesión'
                  : '  Registrase',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
        ),
      ),
    );
  }
}

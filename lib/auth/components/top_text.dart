import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_content.dart';
class TopText extends StatelessWidget{
  final Screens screen;
  const TopText ({Key? key, required this.screen});


  @override
  Widget build(BuildContext context){
    return Text(
      screen == Screens.createAccount ? '¡Crea tu Cuenta!' : '¡Bienvenido\nde\nnuevo!',
      style: const TextStyle(
        fontSize: 50,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w900,

      ),
    );
  }
}
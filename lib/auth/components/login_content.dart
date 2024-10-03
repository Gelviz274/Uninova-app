import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:proyecto_app/Utils/constants.dart';
import 'package:proyecto_app/auth/components/top_text.dart';

import 'bottom_text.dart';



enum Screens{
  createAccount,
  welcomeBack,
}
class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  Widget inputField(String hint, IconData iconData){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 8),
    child: SizedBox(
      height: 50,
      child: Material(
        elevation: 8,
        shadowColor: Colors.black45,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
              filled: true,
              fillColor: Colors.white,
            hintText: hint,
            prefixIcon: Icon(iconData)
          ),
        ),
      ),
    ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {print('registrando..');
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          backgroundColor: kBackgroudColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget orDivider(){
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
              child: Container(
                height: 1,
                color: Colors.white,
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'o registrate con:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
            ),
            ),
          ),
          Flexible(
              child: Container(
                height: 1,
                color: Colors.white,
              )
          ),
        ],
      ),
    );
}

Widget logos(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Image.asset('assets/images/logo-facebook.png',
       width: 40,
       height: 40,),
       const SizedBox(width: 24,),
       Image.asset('assets/images/Logo_google.png',
       width: 30,
       height: 30,)
     ],

  ),
  );
}

Widget forgotPassword(){
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
    child: TextButton(
        onPressed: () {},
        child: const Text('Olvidé mi contraseña',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
        )
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    const currentScreen = Screens.createAccount;
    return Stack(
      children: [
        Positioned(
          top: 120,
            left: 36,
            child: TopText(screen: currentScreen)
        ),
        Padding(
            padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: currentScreen == Screens.welcomeBack ?[
                  inputField('Name', Ionicons.person_add_outline),
                  inputField('Email', Ionicons.mail_open_outline),
                  inputField('Password', Ionicons.lock_closed_outline),
                  loginButton('Registrar'),
                  orDivider(),
                  logos(),
                ] : [
                  inputField('Email', Ionicons.mail_open_outline),
                  inputField('Password', Ionicons.lock_closed_outline),
                  loginButton('Iniciar Sesión'),
                  forgotPassword(),
                ],

              )
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(screen: currentScreen),
          )
        ),

      ],
    );
  }
}

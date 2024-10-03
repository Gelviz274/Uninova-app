import 'package:flutter/material.dart';
import 'Utils/constants.dart';
import 'auth/login_screen.dart';  // Asegúrate de tener este archivo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF2FA98C), // Color de fondo
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kPrimaryColor,
        fontFamily: 'Fredoka'), // Colores de texto
        useMaterial3: true,
      ),
      home: const LoginScreen(), // Asegúrate de definir una pantalla inicial
    );
  }
}



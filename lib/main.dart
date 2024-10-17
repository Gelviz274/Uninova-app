import 'package:flutter/material.dart';
import 'Utils/constants.dart';
import 'screens/log_screen.dart';// Asegúrate de tener este archivo
import 'home/user_screen.dart'; // Importa la nueva pantalla

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
        scaffoldBackgroundColor: kBackgroudColor, // Color de fondo
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: kPrimaryColor,
            fontFamily: 'Fredoka'), // Colores de texto
        useMaterial3: true,
      ),
      home: LoginPage(), // Pantalla inicial
    );
  }
}

// Crear una nueva pantalla después del inicio de sesión
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aquí debes obtener el valor del username que quieres pasar
            String username = "ejemploUsername"; // Cambia esto por el valor real que necesitas

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserView(username: username), // Proporciona el username
              ),
            );
          },
          child: const Text('Ver Usuario Aleatorio'),
        ),
      ),
    );
  }

}

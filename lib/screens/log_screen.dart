import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:proyecto_app/Utils/constants.dart';
import 'package:proyecto_app/home/user_screen.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();


  Widget loginButton(String title, GlobalKey<FormState> formKey, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: 200, // Ancho del botón
        child: ElevatedButton(
          onPressed: () {
            if (_formLoginKey.currentState!.validate()) {
              // Navegar a la segunda pantalla pasando el nombre de usuario
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserView(username: _usernameController.text, ),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: const StadiumBorder(),
            backgroundColor: kPrimaryColor,
            elevation: 8,
            shadowColor: Colors.black87,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    String? validateEmail(String? value) {
      String pattern =
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regExp = RegExp(pattern);
      if (value == null || value.isEmpty) {
        return 'Ingresa un correo electrónico';
      } else if (!regExp.hasMatch(value)) {
        return 'Ingresa un correo electrónico válido';
      }
      return null;
    }


    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo_uninova.png',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                const Text(
                  '¡Crea tu cuenta!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    fontSize: 35,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Bienvenido a Uninova',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 18,
                    ),
                  ),
                ),
                Form(
                  key: _formLoginKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa un nombre de usuario';
                          }
                          if (value.length < 5) {
                            return "Ingresa un nombre de usuario mayor a 5 caracteres";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Nombre de usuario",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          hintText: 'Username123',
                          hintStyle: TextStyle(color: Colors.brown,
                           fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Ionicons.person, color: Colors.brown),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: validateEmail, // Usa la función de validación
                        decoration: InputDecoration(
                          labelText: "Correo electrónico",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          hintText: 'example@gmail.com',
                          prefixIcon: const Icon(Ionicons.mail, color: Colors.brown),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa una contraseña';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          hintText: 'Password123',
                          prefixIcon: const Icon(Ionicons.lock_closed, color: Colors.brown),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown, width: 0.8),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.brown, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      loginButton('Registrar', _formLoginKey, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

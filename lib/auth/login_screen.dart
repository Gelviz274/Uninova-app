import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'center_widget/center_widget.dart';
import 'components/login_content.dart';
import '../home/user_screen.dart'; // Importa la pantalla destino

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
                begin: Alignment(-0.2, -0.8),
                end: Alignment.bottomCenter,
                colors: [Color(0xFF333333), Color(0xFF03624C)])),
      ),
    );
  }

  Widget bottonWidget(double screenWidth) {
    return Container(
      height: 1.5 * screenWidth,
      width: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment(0.6, -1.1),
            end: Alignment(0.7, 0.8),
            colors: [
              Color(0xFF03624C),
              Color(0xFF333333),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -160, left: -30, child: topWidget(screenSize.width)),
          Positioned(
              bottom: -250, left: -40, child: bottonWidget(screenSize.width)),
          centerWidget(size: screenSize),
          const LoginContent(),
          Positioned(
            bottom: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Navega a la pantalla de UserScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserView()),
                );
              },
              child: const Text('Go to User Screen'),
            ),
          ),
        ],
      ),
    );
  }
}

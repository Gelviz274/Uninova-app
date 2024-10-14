import 'package:flutter/material.dart';
import '../Utils/api_service.dart';
import 'user.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late Future<User?> user;

  @override
  void initState() {
    super.initState();
    // Llamamos a la API para obtener un usuario al iniciar el estado
    user = ApiService().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random User')),
      body: Center(
        child: FutureBuilder<User?>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final userData = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(userData.picture),
                  Text(userData.name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(userData.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                  Text(userData.phone,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                  Text(userData.country,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                ],
              );
            } else {
              return Text('No user found');
            }
          },
        ),
      ),
    );
  }
}

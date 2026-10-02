import 'package:flutter/material.dart';

import '../root.dart';

// Widget Class
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State Class
class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login({required String username, required String password}) {
    if (username == "Rafid" && password == "095") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Root()),
      );

      // Memanggil snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login Berhasil!"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text("Login Gagal!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Q8Ls4f_a0MIqSmz9Zj_GHOB7GvBslkNbESYWMzd9mw&s=10',
                  width: 300,
                  height: 300,
                ),
                Text("Selamat datang di Toko Sepatu Selamat Berbelanja"),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    // suffix: Icon(Icons.email),
                    hintText: "username",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    // suffix: Icon(Icons.email),
                    hintText: "password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      _login(
                        username: _usernameController.text,
                        password: _passwordController.text,
                      );
                    },
                    child: Text("Login"),
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

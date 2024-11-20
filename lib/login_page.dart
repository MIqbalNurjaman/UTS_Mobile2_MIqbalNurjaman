import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true; // Untuk mengatur visibilitas password

  void _login() {
    // Memeriksa username dan password
    if (_usernameController.text == 'M Iqbal Nurjaman' &&
        _passwordController.text == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DashboardPage(username: _usernameController.text),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Username atau password yang Anda masukkan salah.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.lightBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40), // Jarak lebih besar sebelum ikon
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.lightBlue, width: 8),
                    ),
                    padding: EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40), // Jarak antara ikon dan form login
              // Form untuk Username
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE14389),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _usernameController,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10), // Spasi antara input username dan password
              // Form untuk Password
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE14389),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _passwordController,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
              ),
              SizedBox(height: 20), // Jarak sebelum tombol
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE14389),
                ),
                child: Text('Masuk', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

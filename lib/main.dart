import 'package:flutter/material.dart';
import 'package:tempvet/view/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black, secondary: Colors.yellow),
        
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: LoginPage(emailController: emailController, passwordController: passwordController),
        ),
      ),
    );
  }
}


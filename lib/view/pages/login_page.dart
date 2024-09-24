import 'package:flutter/material.dart';
import 'package:tempvet/view/widgets/custom_text_form_field.dart';
import 'package:tempvet/view/widgets/green_button.dart';
import 'package:tempvet/view/widgets/outline_button.dart';
import 'package:tempvet/view/widgets/password_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Image.asset(
                'assets/login.png',
                width: constraints.maxWidth * 0.75, // 80% of the screen width
              );
            },
          ),
        ),
        const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        CustomTextFormField(
          title: 'Email',
          suffixIcon: Icons.email,
          controller: emailController,
        ),
        const SizedBox(height: 16,),
        PasswordFormField(
          title: 'Senha',
          suffixIcon: Icons.remove_red_eye,
          controller: passwordController,
        ),
        const SizedBox(height: 32),
        GreenButton(onPressed: (){}, title: 'Entrar'),
        const SizedBox(height: 16),
        OutlineButton(onPressed: (){})
      ],
    );
  }
}

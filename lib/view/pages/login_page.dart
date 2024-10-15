import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/view/bloc/authentication_bloc.dart';
import 'package:tempvet/view/bloc/login_bloc.dart';
import 'package:tempvet/view/pages/home_page.dart';
import 'package:tempvet/view/widgets/custom_text_form_field.dart';
import 'package:tempvet/view/widgets/green_button.dart';
import 'package:tempvet/view/widgets/password_form_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/login.png',
                    fit: BoxFit.cover,
                  ),
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
                GreenButton(
                    onPressed: () {
                    context.read<LoginBloc>().add(LoginButtonPressed(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  }, 
                  title: 'Entrar'
                ),
                const SizedBox(height: 16),
              
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if(state is LoginSuccess) {
                    context.read<AuthenticationBloc>().add(LoggedIn());
                  }
                },
                builder: (context, state) {
                  if(state is LoginFailed) {
                    return const Text('Usuário ou senha inválidos');
                  } else if (state is LoginLoading) {
                    return const Center(child: CircularProgressIndicator(),);
                  } else if(state is LoginSuccess) {
                    return const HomePage();
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

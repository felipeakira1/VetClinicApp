import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/view/bloc/authentication_bloc.dart';
import 'package:tempvet/view/pages/home_page.dart';
import 'package:tempvet/view/pages/login_page.dart';

class AuthDecider extends StatelessWidget {
  const AuthDecider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        if(state is AuthenticationAuthenticated) {
          return const HomePage();
        } else if(state is AuthenticationUnauthenticated) {
          return LoginPage();
        }
        return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
      }
    );
  }
}
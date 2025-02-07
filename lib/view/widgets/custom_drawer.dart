import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/view/bloc/authentication_bloc.dart' as auth;
import 'package:tempvet/view/bloc/login_bloc.dart' as login;
import 'package:tempvet/view/pages/animals_page.dart';
import 'package:tempvet/view/pages/guardians_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.green.shade900),
                ),
                const SizedBox(height: 8),
                const Text(
                  'VetClinic',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Felipe', style: TextStyle(color: Colors.white, fontSize: 16)),
              ]
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.green.shade900),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.pets, color: Colors.green.shade900),
            title: const Text('Animais'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnimalsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.green.shade900),
            title: const Text('Tutores'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GuardiansPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Sair'),
            onTap: () {
              context.read<login.LoginBloc>().add(login.LoggedOut());
              context.read<auth.AuthenticationBloc>().add(auth.LoggedOut());
            },
          ),
        ],
      ),
    );
  }
}
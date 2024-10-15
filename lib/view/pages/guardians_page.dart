import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/view/bloc/animals_bloc.dart';
import 'package:tempvet/view/bloc/guardians_bloc.dart';
import 'package:tempvet/view/shared/text_styles.dart';
import 'package:tempvet/view/widgets/animal_tile.dart';
import 'package:tempvet/view/widgets/custom_app_bar.dart';
import 'package:tempvet/view/widgets/custom_text_form_field.dart';
import 'package:tempvet/view/widgets/green_button.dart';
import 'package:tempvet/view/widgets/guardian_tile.dart';

class GuardiansPage extends StatefulWidget {
  const GuardiansPage({super.key});

  @override
  State<GuardiansPage> createState() => _GuardiansPageState();
}

class _GuardiansPageState extends State<GuardiansPage> {
  TextEditingController searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GuardiansBloc>(context).add(LoadGuardians());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: 
          [
            Column(
            children: [
              const Center(child: Text('Tutores', style: CustomTextStyles.title,),),
              Column(
                children: [
                  CustomTextFormField(title: 'Pesquisar', suffixIcon: Icons.search, controller: searchController)
                ],
              ),
              const SizedBox(height: 16,),
              Expanded(
                child: BlocBuilder<GuardiansBloc, GuardiansStates>(
                  builder: (context, state) {
                    if (state is AnimalsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GuardiansLoaded) {
                      return ListView.builder(
                        itemCount: state.guardians.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GuardianTile(guardian: state.guardians[index]),
                              const SizedBox(height: 8,)
                            ],
                          );
                        }, 
                      );
                    } else {
                      return const Center(child: Text('Erro ao carregar tutores'));
                    }
                  }
                )
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: GreenButton(onPressed: () {
                Navigator.pushNamed(context, '/add-guardian');
              }, title: 'Adicionar tutor',),
            )
          ]
        ),
      ),
    );
  }
}
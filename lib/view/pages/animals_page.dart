import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/view/bloc/animals_bloc.dart';
import 'package:tempvet/view/shared/text_styles.dart';
import 'package:tempvet/view/widgets/animal_tile.dart';
import 'package:tempvet/view/widgets/custom_app_bar.dart';
import 'package:tempvet/view/widgets/custom_text_form_field.dart';
import 'package:tempvet/view/widgets/green_button.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  TextEditingController searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AnimalsBloc>(context).add(LoadAnimals());
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
              const Center(child: Text('Animais', style: CustomTextStyles.title,),),
              Column(
                children: [
                  CustomTextFormField(title: 'Pesquisar', suffixIcon: Icons.search, controller: searchController)
                ],
              ),
              const SizedBox(height: 16,),
              Expanded(
                child: BlocBuilder<AnimalsBloc, AnimalsStates>(
                  builder: (context, state) {
                    if (state is AnimalsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AnimalsLoaded) {
                      return ListView.builder(
                        itemCount: state.animals.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              AnimalTile(animal: state.animals[index]),
                              const SizedBox(height: 8,)
                            ],
                          );
                        }, 
                      );
                    } else {
                      return const Center(child: Text('Erro ao carregar animais'));
                    }
                  }
                )
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: GreenButton(onPressed: () {
                Navigator.pushNamed(context, '/add-animal');
              }, title: 'Adicionar animal',),
            )
          ]
        ),
      ),
    );
  }
}
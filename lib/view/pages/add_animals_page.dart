import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/view/bloc/animals_bloc.dart';
import 'package:tempvet/view/bloc/guardians_bloc.dart';
import 'package:tempvet/view/shared/breeds.dart';
import 'package:tempvet/view/shared/text_styles.dart';
import 'package:tempvet/view/widgets/custom_app_bar.dart';
import 'package:tempvet/view/widgets/custom_autocomplete.dart';
import 'package:tempvet/view/widgets/custom_dropdown.dart';
import 'package:tempvet/view/widgets/custom_text_form_field.dart';
import 'package:tempvet/view/widgets/green_button.dart';

class AddAnimalsPage extends StatefulWidget {
  const AddAnimalsPage({super.key});

  @override
  State<AddAnimalsPage> createState() => _AddAnimalsPageState();
}

class _AddAnimalsPageState extends State<AddAnimalsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String? specie;
  String? breed;
  List<String> breeds = [];
  String? gender;
  String _errorText = '';
  int? guardianId;
  String? tutor;

  String? validator(value) {
    if(value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    context.read<GuardiansBloc>().add(LoadGuardians());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Adicionar animal', style: CustomTextStyles.title),
              const SizedBox(height: 16,),
              CustomTextFormField(
                title: 'Nome', 
                suffixIcon: Icons.text_fields_sharp, 
                controller: nameController,
                errorText: _errorText,
                validator: validator,
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdown(
                      label: 'Espécie', 
                      items: Breeds.species,
                      selectedItem: specie,
                      onChanged: (value) {
                        setState(() {
                          specie = value;
                          breeds = Breeds.getBreeds(specie!);
                        });
                      },
                      validator: validator,
                    ),
                  ),
                  const SizedBox(width: 8.0,),
                  Expanded(
                      child: CustomDropdown(
                        label: 'Raça', 
                        items: breeds,
                        selectedItem: breed,
                        onChanged: (value) {
                          setState(() {
                            breed = value;
                          });
                        },
                        validator: validator,
                      ),
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: ageController,
                      title: 'Idade',
                      suffixIcon: Icons.calendar_today,
                      validator: validator,
                      errorText: _errorText,
                    )
                  ),
                  const SizedBox(width: 8.0,),
                  Expanded(
                      child: CustomDropdown(
                        label: 'Sexo', 
                        items: const ['Masculino', 'Feminino'],
                        selectedItem: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        validator: validator,
                      ),
                    )
                ],
              ),
              const SizedBox(height: 8,),
              BlocBuilder<GuardiansBloc, GuardiansStates>(
                builder: (context, state) {
                  if (state is GuardiansLoaded) {
                    return CustomAutocomplete<Guardian>(
                      title: 'Selecione o tutor',
                      options: state.guardians,
                      onSelected: (Guardian selectedGuardian) {
                        setState(() {
                          guardianId = selectedGuardian.id;
                        });
                      },
                      displayStringForOption: (Guardian option) => option.name,
                      optionFilter: (Guardian option, String text) => option.name.toLowerCase().contains(text.toLowerCase()),
                      validator: (value) {
                        if(value == null) {
                          return 'Este campo é obrigatório';
                        }
                        return null;
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 16,),
              GreenButton(onPressed: (){
                _errorText = '';
                if(_formKey.currentState!.validate()) {
                  context.read<AnimalsBloc>().add(AddAnimal(animal: Animal(
                    name: nameController.text,
                    species: specie!,
                    breed: breed!,
                    age: int.parse(ageController.text),
                    gender: gender!,
                    guardianId: guardianId!
                  )));
                  showDialog(
                    context: context, 
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        title: const Text('Animal adicionado com sucesso!', style: CustomTextStyles.subtitle,),
                        actions: [
                          GreenButton(onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            context.read<AnimalsBloc>().add(LoadAnimals());
                          }, title: 'OK')
                        ],
                      );
                    }
                  );
                } else {
                  setState(() {
                    _errorText = 'Este campo é obrigatório';
                  });
                }
              }, title: 'Adicionar animal'),
            ],
          ),
        ),
      ),
    );
  }
}
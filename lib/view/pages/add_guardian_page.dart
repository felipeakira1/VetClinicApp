import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/view/bloc/guardians_bloc.dart';
import 'package:tempvet/view/shared/text_styles.dart';
import 'package:tempvet/view/widgets/custom_app_bar.dart';
import 'package:tempvet/view/widgets/custom_text_form_field.dart';
import 'package:tempvet/view/widgets/green_button.dart';

class AddGuardiansPage extends StatefulWidget {
  const AddGuardiansPage({super.key});

  @override
  State<AddGuardiansPage> createState() => _AddGuardiansPageState();
}

class _AddGuardiansPageState extends State<AddGuardiansPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cpfController = TextEditingController();
  String _errorText = '';


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
              const Text('Adicionar tutor', style: CustomTextStyles.title),
              const SizedBox(height: 16,),
              CustomTextFormField(
                title: 'Nome', 
                suffixIcon: Icons.text_fields_sharp, 
                controller: nameController,
                errorText: _errorText,
                validator: validator,
              ),
              const SizedBox(height: 8,),
              CustomTextFormField(
                title: 'E-mail',
                suffixIcon: Icons.email,
                controller: emailController,
                errorText: _errorText,
                validator: validator,
              ),
              const SizedBox(height: 8,),
              CustomTextFormField(
                title: 'Endereço',
                suffixIcon: Icons.location_on,
                controller: addressController,
                errorText: _errorText,
                validator: validator,
              ),
              const SizedBox(height: 8,),
              CustomTextFormField(
                title: 'CPF',
                suffixIcon: Icons.info_outlined,
                controller: cpfController,
                errorText: _errorText,
                validator: validator,
              ),
              const SizedBox(height: 16,),
              GreenButton(onPressed: (){
                _errorText = '';
                if(_formKey.currentState!.validate()) {
                  context.read<GuardiansBloc>().add(AddGuardian( 
                    guardian: Guardian(
                      name: nameController.text,
                      email: emailController.text,
                      address: addressController.text,
                      cpf: cpfController.text
                    )
                  ));
                  showDialog(
                    context: context, 
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        title: const Text('Tutor adicionado com sucesso!', style: CustomTextStyles.subtitle,),
                        actions: [
                          GreenButton(onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            context.read<GuardiansBloc>().add(LoadGuardians());
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
              }, title: 'Adicionar tutor'),
            ],
          ),
        ),
      ),
    );
  }
}
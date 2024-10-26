import 'package:cookly/modules/auth/presentation/widgets/bloc/registration_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/router/router.dart';

class RegistrationForm extends StatelessWidget {
  RegistrationForm({super.key});
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationFormCubit>(
      create: (context) => locator.get<RegistrationFormCubit>(),
      child: BlocBuilder<RegistrationFormCubit, RegistrationFormState>(
        builder: (context, state) => Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: _nicknameController,
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź nazwę uzytkownika',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź adres email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Nieprawidłowy adres email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź hasło',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _repeatedPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Powtórz hasło',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if(_passwordController.value != _repeatedPasswordController.value){
                      return 'Podane hasła nie są takie same.';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await BlocProvider.of<RegistrationFormCubit>(context).runRegistrationForm(_nicknameController.value.text, _emailController.value.text, _passwordController.value.text);

                        context.pop();

                        router.go('main_page');
                      }
                    },
                    child: const Text('Rejestruj'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
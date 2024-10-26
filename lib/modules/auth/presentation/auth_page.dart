import 'package:cookly/core/di/locator.dart';
import 'package:cookly/modules/auth/bloc/auth_cubit.dart';
import 'package:cookly/modules/auth/presentation/widgets/registration_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider<AuthCubit>(
      create: (context) => locator.get<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Placeholder(
                  fallbackHeight: 200,
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: usernameController,
                  
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () async => await BlocProvider.of<AuthCubit>(context).runLoginFlowWithEmailAndPasswordProvider(usernameController.value.text, passwordController.value.text), 
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: const Text('Login'),
                  )
                ),
                const SizedBox(height: 20,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(text: 'Nie masz konta?\n', style: TextStyle(color: Colors.black)),
                      TextSpan(text: 'Utwórz nowe', style: const TextStyle(color: Colors.blue), recognizer: TapGestureRecognizer()..onTap = () {
                        showModalBottomSheet(
                          context: context, 
                          builder: (context) => RegistrationForm()
                        );
                      })
                    ]
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Zaloguj się z\n', style: TextStyle(color: Colors.black)),
                        TextSpan(text: 'Google', style: const TextStyle(color: Colors.blue), recognizer: TapGestureRecognizer()..onTap = () async {
                          await BlocProvider.of<AuthCubit>(context).runLoginFlowWithGoogleProvider();
                        })
                      ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
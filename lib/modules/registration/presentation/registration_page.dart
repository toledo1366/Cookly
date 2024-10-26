import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 117, 43),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text('Nazwa uzytkownika: '),
                TextFormField(

                ),
                const Spacer(),
                Text('Email'),
                TextFormField(

                ),
                const Spacer(),
                Text('Hasło'),
                TextFormField(

                ),
                const Spacer(),
                Text('Powtórz hasło'),
                TextFormField(

                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  child: ElevatedButton(
                    onPressed: (){}, 
                    child: Text('Rejestracja')
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        )
      ),
    );
  }
}
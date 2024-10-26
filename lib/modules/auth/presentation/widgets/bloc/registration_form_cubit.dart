import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'registration_form_state.dart';
part 'registration_form_cubit.freezed.dart';

@injectable
class RegistrationFormCubit extends Cubit<RegistrationFormState>{
  RegistrationFormCubit() : super(const RegistrationFormState.initialized());
  
  Future<void> runRegistrationForm(String username, String email, String password) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password:password);
  }
}
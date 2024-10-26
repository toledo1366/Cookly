import 'package:cookly/core/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(const AuthState.created());

  Future<void> runLoginFlowWithEmailAndPasswordProvider(String email, String password) async {
    emit(const AuthState.loading());

    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    if(result.credential == null){
      emit(const AuthState.error('Nie mozna zalogować.'));
    }

    router.go('/main_dashboard');
  }

  Future<void> runLoginFlowWithGoogleProvider() async {
    emit(const AuthState.loading());

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result = await FirebaseAuth.instance.signInWithCredential(credential);

      if(result.credential == null){
        emit(const AuthState.error('Nie mozna zalogować.'));
      }

      router.go('/main_dashboard');
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }
}
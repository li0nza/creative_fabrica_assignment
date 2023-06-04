import 'package:creative_fabrica_assignment/presentation/bloc/login/login_state.dart';
import 'package:creative_fabrica_assignment/presentation/pages/mars_photos_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [Cubit] managing the [LoginState]. Requires the [getMarsPhotos] `use case`
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.loading());

  /// Method to do anonymous login.
  /// On success will emit `LoginState.success`
  /// On Failure will emit `LoginState.error`
  void doAnonymousSignIn(BuildContext context) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      emit(LoginState.success(user: userCredential));
      Future.delayed(
        const Duration(seconds: 2),
        () =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MarsPhotosPage()), (Route<dynamic> route) => false),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          emit(const LoginState.error(error: "Anonymous auth hasn't been enabled for this project."));
          break;
        default:
          emit(LoginState.error(error: 'Unknown error: ${e.code}'));
      }
    }
  }
}

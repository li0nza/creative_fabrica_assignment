
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

/// State representing the current state of the [LoginCubit].
@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = _LoadingState;
  const factory LoginState.success({required UserCredential user}) = _SuccessState;
  const factory LoginState.error({required String error}) = _ErrorState;
}

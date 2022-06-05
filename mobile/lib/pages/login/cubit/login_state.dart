part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.prompting() = _LoginPromptState;
  factory LoginState.loading() = _LoginLoadingState;
  factory LoginState.loggedIn() = _LoginLoggedInState;
}

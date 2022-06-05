import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.prompting());

  Future<void> loginWithGoogle() async {
    emit(state);
  }
}

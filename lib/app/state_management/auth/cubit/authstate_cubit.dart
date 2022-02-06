import 'package:async/async.dart';
import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authstate_state.dart';

class AuthstateCubit extends Cubit<AuthState> {
  AuthstateCubit() : super(AuthStateInitial());

  /// This is the signIn() that takes the IAuthService to
  /// interact with our module and present according states.

  Future signIn(IAuthService authService) async {
    _startLoading();

    final result = await authService.signIn();

    _setResultOfAuthState(result);
  }

  Future signOut(IAuthService authService) async {}

  void _setResultOfAuthState(Result<Token> result) {
    if (result.asError != null) {
      emit(AuthStateError(result.asError!.error.toString()));
      return;
    }

    emit(AuthStateSuccess(result.asValue!.value));
  }

  void _startLoading() {
    emit(AuthStateLoading());
  }
}

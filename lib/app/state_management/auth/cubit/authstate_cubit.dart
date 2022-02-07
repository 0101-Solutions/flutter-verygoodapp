import 'package:async/async.dart';
import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:verygoodapp/app/cache/local_store_contract.dart';
import 'package:verygoodapp/app/data/models/user.dart';

part 'authstate_state.dart';

class AuthstateCubit extends Cubit<AuthState> {
  AuthstateCubit(this.localStore) : super(AuthStateInitial());

  final ILocalStore localStore;

  /// This is the signIn() that takes the IAuthService to
  /// interact with our module and present according states.
  Future signIn(IAuthService authService) async {
    _startLoading();

    final result = await authService.signIn();

    _setResultOfAuthState(result);
  }

  Future signOut(IAuthService authService) async {
    _startLoading();
    final token = await localStore.fetch();

    final result = await authService.signOut(token);

    if (result.asValue!.value) {
      localStore.delete(token);
      emit(AuthSignOutStateSuccess());
    } else {
      emit(AuthStateError('Error Signing Out. Invalid Token.'));
    }
  }

  Future signUp(ISignUpService signUpService, User user) async {
    _startLoading();

    final result = await signUpService.signUp(
      user.email,
      user.name,
      user.password,
    );

    _setResultOfAuthState(result);
  }

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

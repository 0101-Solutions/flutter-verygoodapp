part of 'authstate_cubit.dart';

abstract class AuthState extends Equatable {}

class AuthStateInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthStateSuccess extends AuthState {
  AuthStateSuccess(this.token);

  final Token token;

  @override
  List<Object> get props => [token];
}

class AuthStateError extends AuthState {
  AuthStateError(this.message);

  final String message;

  @override
  List<Object> get props => [];
}

class AuthSignOutStateSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticatioinSuccessfulState extends AuthenticationState {
  final UserCredential userCredential;
  const AuthenticatioinSuccessfulState({required this.userCredential});
}

class LoadingState extends AuthenticationState {}

class AuthErrorState extends AuthenticationState {
  final String message;
  const AuthErrorState({required this.message});
}

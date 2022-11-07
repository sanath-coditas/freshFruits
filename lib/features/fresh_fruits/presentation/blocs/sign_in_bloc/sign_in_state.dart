part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInSuccessState extends SignInState {
  final UserCredential userCredential;
  const SignInSuccessState({required this.userCredential});
}

class LoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;
  const SignInErrorState({required this.message});
}

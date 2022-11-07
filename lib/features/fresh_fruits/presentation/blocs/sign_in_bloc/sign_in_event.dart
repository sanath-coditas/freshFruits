part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class ResetSignInEvent extends SignInEvent {}

class SignnInUserEvent extends SignInEvent {
  final SignInParams signInParams;
  const SignnInUserEvent({required this.signInParams});
}

part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateUser extends AuthenticationEvent {
  final PersonModel person;
  const AuthenticateUser({required this.person});
}

class AuthenticationResetEvent extends AuthenticationEvent {}

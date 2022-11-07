import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  const Person(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  @override
  List<Object?> get props => [firstName, lastName, email, password];
}

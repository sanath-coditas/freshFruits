import 'package:fresh_fruits/features/fresh_fruits/domain/entities/person.dart';

class PersonModel extends Person {
  const PersonModel(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.password});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
    return data;
  }
}

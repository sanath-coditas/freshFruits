import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/usecase/usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/person_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/person_repository.dart';

class CreateUserUsecase implements Usecase<UserCredential, PersonParams> {
  final PersonRepository personRepository;
  const CreateUserUsecase({required this.personRepository});
  @override
  Future<Either<Failure, UserCredential>> call(
      PersonParams personParams) async {
    return await personRepository.authenticateUser(personParams.person);
  }
}

class PersonParams extends Equatable {
  final PersonModel person;
  const PersonParams({required this.person});
  @override
  List<Object?> get props => [person];
}

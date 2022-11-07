import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/authentication/authentication_source.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/person_model.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/person_repository.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/sign_in_usecase.dart';

class PersonRepositoryImpl implements PersonRepository {
  final AuthenticationSource remoteDataSource;
  const PersonRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserCredential>> authenticateUser(
      PersonModel person) async {
    return await remoteDataSource.authenticateUser(person);
  }

  @override
  Future<Either<Failure, UserCredential>> signInUser(
      SignInParams signInParams) async {
    return await remoteDataSource.signInUser(signInParams);
  }
}

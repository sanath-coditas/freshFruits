import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/person_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/sign_in_usecase.dart';
import '../../../../core/error/failure.dart';

abstract class PersonRepository {
  Future<Either<Failure, UserCredential>> authenticateUser(PersonModel person);
  Future<Either<Failure, UserCredential>> signInUser(SignInParams params);
}

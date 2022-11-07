import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/usecase/usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/person_repository.dart';

class SignInUsecase implements Usecase<UserCredential, SignInParams> {
  final PersonRepository personRepository;

  const SignInUsecase({required this.personRepository});
  @override
  Future<Either<Failure, UserCredential>> call(SignInParams params) async {
    return await personRepository.signInUser(params);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;
  const SignInParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

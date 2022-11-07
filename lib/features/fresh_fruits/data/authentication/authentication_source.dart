import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/person_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/sign_in_usecase.dart';

abstract class AuthenticationSource {
  Future<Either<Failure, UserCredential>> authenticateUser(
      PersonModel personModel);
  Future<Either<Failure, UserCredential>> signInUser(SignInParams params);
}

class FireBaseAuthenticationSource implements AuthenticationSource {
  @override
  Future<Either<Failure, UserCredential>> authenticateUser(
      PersonModel personModel) async {
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: personModel.email,
        password: personModel.password,
      );
      FirebaseAuth.instance.currentUser?.updateDisplayName(
          '${personModel.firstName} ${personModel.lastName}');
      return Right(response);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(FirebaseAuthFailure(
            errorMsg: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(FirebaseAuthFailure(
            errorMsg: 'The account already exists for that email.'));
      } else {
        return Left(FirebaseAuthFailure(errorMsg: 'An Error Occured'));
      }
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInUser(
      SignInParams params) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: params.email, password: params.password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(
            (SignInFailure(errorMessage: 'No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        return Left(SignInFailure(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        return Left(SignInFailure(errorMessage: 'An Error Occured'));
      }
    }
  }
}

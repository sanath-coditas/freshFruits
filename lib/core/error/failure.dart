abstract class Failure {
  final String message;

  Failure({required this.message});
}

class FirebaseAuthFailure extends Failure {
  final String errorMsg;
  FirebaseAuthFailure({required this.errorMsg}) : super(message: errorMsg);
}

class SignInFailure extends Failure {
  final String errorMessage;
  SignInFailure({required this.errorMessage}) : super(message: errorMessage);
}

class FruitsFetchFailure extends Failure {
  final String errorMsg;
  FruitsFetchFailure({required this.errorMsg}) : super(message: errorMsg);

}

class AddToCartFailure extends Failure{
  final String errorMsg;
  AddToCartFailure({required this.errorMsg}) : super(message: errorMsg);
}
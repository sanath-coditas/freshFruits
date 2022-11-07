import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/person_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/authenticate_user_usecase.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final CreateUserUsecase authenticateUserUsecase;
  AuthenticationBloc({required this.authenticateUserUsecase})
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AuthenticationResetEvent>(
      (event, emit) => emit(AuthenticationInitial()),
    );
    on<AuthenticateUser>((event, emit) async {
      emit(LoadingState());
      final getAuthStatus =
          await authenticateUserUsecase(PersonParams(person: event.person));

      getAuthStatus.fold(
          (error) => emit(AuthErrorState(message: error.message)),
          (r) => emit(AuthenticatioinSuccessfulState(userCredential: r)));
    });
  }
}

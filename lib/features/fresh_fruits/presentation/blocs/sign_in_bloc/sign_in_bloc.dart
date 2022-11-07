import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUsecase signInUsecase;

  SignInBloc({required this.signInUsecase}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<ResetSignInEvent>((event, emit) {
      emit(SignInInitial());
    });
    on<SignnInUserEvent>((event, emit) async {
      emit(LoadingState());
      final getSignInStatus = await signInUsecase(event.signInParams);
      getSignInStatus.fold((l) => emit(SignInErrorState(message: l.message)),
          (r) => emit(SignInSuccessState(userCredential: r)));
    });
  }
}

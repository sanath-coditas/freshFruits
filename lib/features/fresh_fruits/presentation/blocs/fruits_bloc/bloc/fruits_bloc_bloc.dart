import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/fruit.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/fetch_fruits_usecase.dart';

part 'fruits_bloc_event.dart';
part 'fruits_bloc_state.dart';

class FruitsBlocBloc extends Bloc<FruitsBlocEvent, FruitsBlocState> {
  final FetchFruitsUsecase fetchFruitsUsecase;

  FruitsBlocBloc({required this.fetchFruitsUsecase})
      : super(FruitsBlocInitial()) {
    on<FruitsBlocEvent>((event, emit) {});
    on<FetchFruitsEvent>((event, emit) async {
      emit(LoadingState());
      final fruitsStatus = await fetchFruitsUsecase(const NoParams());
      fruitsStatus.fold((l) => emit(ErrorState(message: l.message)), (r) {
        return emit(SuccessState(fruits: r));
      });
    });
  }
}

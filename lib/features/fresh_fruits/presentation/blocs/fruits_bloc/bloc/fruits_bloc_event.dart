part of 'fruits_bloc_bloc.dart';

abstract class FruitsBlocEvent extends Equatable {
  const FruitsBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchFruitsEvent extends FruitsBlocEvent{}
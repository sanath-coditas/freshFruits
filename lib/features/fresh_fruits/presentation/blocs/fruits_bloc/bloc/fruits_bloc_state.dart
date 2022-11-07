part of 'fruits_bloc_bloc.dart';

abstract class FruitsBlocState extends Equatable {
  const FruitsBlocState();

  @override
  List<Object> get props => [];
}

class FruitsBlocInitial extends FruitsBlocState {}

class LoadingState extends FruitsBlocState {}

class SuccessState extends FruitsBlocState {
  final List<Fruit> fruits;
  const SuccessState({required this.fruits});
}

class ErrorState extends FruitsBlocState {
  final String message;
  const ErrorState({required this.message});
}

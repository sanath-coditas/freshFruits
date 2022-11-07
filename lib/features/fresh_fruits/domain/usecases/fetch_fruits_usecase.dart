import 'package:equatable/equatable.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/usecase/usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/fruit.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/fruits_repository.dart';

class FetchFruitsUsecase implements Usecase<List<Fruit>, NoParams> {
  final FruitsRepository fruitsRepository;
  const FetchFruitsUsecase({required this.fruitsRepository});
  @override
  Future<Either<Failure, List<Fruit>>> call(NoParams params) async {
    return await fruitsRepository.getFruits(params);
  }
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}

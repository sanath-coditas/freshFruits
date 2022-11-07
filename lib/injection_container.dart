import 'package:fresh_fruits/features/fresh_fruits/data/authentication/authentication_source.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/datasources/remote_datasources/firestore_datasource.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/repositories/fruits_repository_impl.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/repositories/person_repository_impl.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/fruits_repository.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/person_repository.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/add_to_cart_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/authenticate_user_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/cart_items_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/fetch_fruits_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/sign_in_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/blocs/cart_products/bloc/cart_products_bloc.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/blocs/fruits_bloc/bloc/fruits_bloc_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/fresh_fruits/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'features/fresh_fruits/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';

void init() {
  final sl = GetIt.instance;

  //! Blocs
  sl.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(authenticateUserUsecase: sl()));
  sl.registerFactory<SignInBloc>(() => SignInBloc(signInUsecase: sl()));
  sl.registerFactory<FruitsBlocBloc>(
      () => FruitsBlocBloc(fetchFruitsUsecase: sl()));
  sl.registerFactory<CartProductsBloc>(
      () => CartProductsBloc(cartItemsUsecase: sl(), addToCartUseCase: sl()));

  //! Usecases
  sl.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(personRepository: sl()));
  sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(personRepository: sl()));
  sl.registerLazySingleton<FetchFruitsUsecase>(
      () => FetchFruitsUsecase(fruitsRepository: sl()));
  sl.registerLazySingleton<CartItemsUsecase>(
      () => CartItemsUsecase(fruitsRepository: sl()));
  sl.registerLazySingleton<AddToCartUseCase>(
      () => AddToCartUseCase(fruitsRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<FruitsRepository>(
      () => FruitsRepositoryImpl(fireStoreDataSource: sl()));

  //! DataSources
  sl.registerLazySingleton<AuthenticationSource>(
      () => FireBaseAuthenticationSource());
  sl.registerLazySingleton<FireStoreDataSource>(
      () => FireStoreDataSourceImplementation());
}

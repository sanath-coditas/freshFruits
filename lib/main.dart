import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/homescreen.dart';
import 'package:get_it/get_it.dart';
import 'features/fresh_fruits/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'features/fresh_fruits/presentation/blocs/cart_products/bloc/cart_products_bloc.dart';
import 'features/fresh_fruits/presentation/blocs/fruits_bloc/bloc/fruits_bloc_bloc.dart';
import 'features/fresh_fruits/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<AuthenticationBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<SignInBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<FruitsBlocBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.instance<CartProductsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: ColorConstants.appTheme),
        home: HomeScreen(),
      ),
    );
  }
}

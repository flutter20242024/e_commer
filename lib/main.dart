import 'package:e_commerce/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/bloc/chat_cubit/chat_cubit.dart';
import 'package:e_commerce/bloc/fav_cubit/fav_cubit.dart';
import 'package:e_commerce/helper/functions_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getUserData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavCubit(),
        ),
         BlocProvider(
          create: (context) => AuthCubit(),
        ),
           BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          fontFamily: "open_bold",
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

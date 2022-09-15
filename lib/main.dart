import 'package:sparks_bank/modules/SplashScreen.dart';
import 'package:sparks_bank/shared/BLoC/cubit.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparks_bank/shared/Components/constants.dart';
import 'package:sparks_bank/shared/network/remote/bloc_observer.dart';

import 'modules/WelcomeScreen.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(MultiBlocProvider(providers: [
        BlocProvider<BankCubit>(
          create: (context) => BankCubit()..CreateDataBase()                 
        ),
      ], child: MyApp()));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BankCubit()
        ..CreateDataBase() 
                  // ..InsertIntoUsers(name: "Doaa salem", email: "Doaa@gmail.com", amount: 3000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Salma mohamed", email: "salma@gamil.com", amount: 1200,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Eman Ashraf", email: "eman@gmail.com", amount: 4000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Farida Ahmed", email: "frfr@gmail.com", amount: 5500,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Ashraf Raslan", email: "Raslan@gamil.com", amount: 2000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Hoda Ashraf", email: "hodhod@gmail.com", amount: 6000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Laila Alaa", email: "laila@gmail.com", amount: 7080,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Mona elsayed", email: "monmon@gmail.com", amount: 8000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Blossom", email: "Blo@gmail.com", amount: 7700,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Bubbles", email: "Bubbles@gmail.com", amount: 5000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Buttercup", email: "butter@gmail.com", amount: 6000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "jimmy neotron", email: "jimmy@gamil.com", amount: 10000,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "timmy turner", email: "timmy@gmail.com", amount: 150,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Baseet najm", email: "star@gmail.com", amount: 0,phone: "01123453224",url:"assets/images/profile.png")
                  // ..InsertIntoUsers(name: "Dany el-shaba7", email: "dany@gamil.com", amount: 7600,phone: "01123453224",url:"assets/images/profile.png"),      
    )],
      child: BlocConsumer<BankCubit, BankSatates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                backgroundColor: Colors.white,
                elevation: 0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: secondary,
                    statusBarBrightness: Brightness.dark),
              ),
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

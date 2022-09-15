import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparks_bank/shared/BLoC/cubit.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';
import 'package:sparks_bank/shared/Components/constants.dart';

class Layout extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankCubit,BankSatates>(
      builder: (context,state){
        var cubit=BankCubit.get(context);
        int index=cubit.currentIndex;
         return Scaffold(

      body: cubit.Screens[index],

       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 20.0,
        elevation: 15.0,
        unselectedItemColor: secondary,
        selectedItemColor: primary,
        currentIndex: cubit.currentIndex,
        onTap: ((value) {
          cubit.ChangeNavBarIndex(value);
        }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label:"Users"),
            BottomNavigationBarItem(icon: Icon(Icons.transform),label:"Transactions"),
            BottomNavigationBarItem(icon: Icon(Icons.info),label:"About us"),
          ],
        ),

    );
      },
       listener: (context,state){});
    throw UnimplementedError();
  }

}
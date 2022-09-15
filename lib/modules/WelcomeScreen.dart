import 'package:flutter/services.dart';
import 'package:sparks_bank/modules/Transactions.dart';
import 'package:sparks_bank/modules/Users.dart';
import 'package:sparks_bank/shared/BLoC/cubit.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparks_bank/shared/Components/constants.dart';
import 'package:sqflite/sqlite_api.dart';

class WelcomeScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    var cubit=BankCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME to SPARKS BANK!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,fontFamily: 'DancingScript',color:secondary),),
        backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark),
      ),
      body:Padding(padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
          children: [
           //Text("WELCOME to SPARKS BANK!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
           SizedBox(height:3),
           Text("   more than you expect from a Bank!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: primary,fontFamily: 'Lobster'),),
           SizedBox(height:35),
            Image(image: AssetImage('assets/images/mobile-money-transfer.png')),
            
            
            SizedBox(height:20),
            GredientButton(
              onPressed: ()
              {
                
                  cubit.navigateTo(context,UsersScreen());

                  
                  cubit.InsertIntoUsers(name: "Laila Alaa", email: "laila@gmail.com", amount: 3000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Eman Ali", email: "eman@gamil.com", amount: 1200,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Mai Mohamed", email: "mai@gmail.com", amount: 4000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Safaa Saif", email: "safaa@gmail.com", amount: 5500,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Noha Esam", email: "noha@gamil.com", amount: 2000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Amira Said", email: "amira@gmail.com", amount: 6000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Reda Ahmed", email: "reda@gmail.com", amount: 7080,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Samah Mohamed", email: "samah@gmail.com", amount: 8000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Yomna Saad", email: "Blo@gmail.com", amount: 7700,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Bubbles", email: "Bubbles@gmail.com", amount: 5000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Buttercup", email: "butter@gmail.com", amount: 6000,phone: "01123453224",url:"assets/images/profile.png");
                   cubit.InsertIntoUsers(name: "Blossom", email: "Blo@gamil.com", amount: 7600,phone: "01123453224",url:"assets/images/profile.png"); 
                  cubit.InsertIntoUsers(name: "jimmy neotron", email: "jimmy@gamil.com", amount: 10000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "timmy turner", email: "timmy@gmail.com", amount: 150,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Sandy", email: "sandy@gmail.com", amount: 0,phone: "01123453224",url:"assets/images/profile.png");
                  
                 //cubit.InsertIntoTransactions(sender: "heba", reciever: "hoda", amount: 10,datetime: "7/9/2020 3:04 am");
                //  print("users[0]${cubit.users[0]}");
                //  print("transaction[0] ${cubit.transactions[0]}");

              },
                  splashColor: Color.fromARGB(255, 42, 238, 192),
                  colors: [
                     primary,
                    secondary                      
                  ], title: "            All users          ",),
                  SizedBox(height:10),
            GredientButton(
              onPressed: (){
                // print( "${BankCubit.get(context).transactions[1]['sender']}sss");
                // print( "${BankCubit.get(context).transactions[3]['datetime']}rrr");
                cubit.navigateTo(context, TransactionsScreen());
              },
                  splashColor: Color.fromARGB(255, 42, 238, 192),
                  colors: [

                    primary,
                    secondary                    
                  ], title: "     All transactions    ",),
                 
                  SizedBox(height:10),
                  GredientButton(
              onPressed: (){
                // print( "${BankCubit.get(context).transactions[1]['sender']}sss");
                // print( "${BankCubit.get(context).transactions[3]['datetime']}rrr");
                cubit.navigateTo(context, TransactionsScreen());
              },
                  splashColor: Color.fromARGB(255, 42, 238, 192),
                  colors: [

                    primary,
                    secondary                    
                  ], title: "               About            ",),
          ],
        ),
        )) ,

       

    );
    throw UnimplementedError();
  }
  
}
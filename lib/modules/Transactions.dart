import 'dart:ui';

import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:sparks_bank/shared/BLoC/cubit.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';
import 'package:sparks_bank/shared/Components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparks_bank/shared/Components/constants.dart';

class TransactionsScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<BankCubit,BankSatates>(
      builder: (context,state){
      var cubit=BankCubit.get(context);
        return Scaffold(
      appBar: AppBar(title: Center(child: Text("Transactions",style:TextStyle(fontWeight: FontWeight.w100,color: primary,fontFamily: 'Lobster',fontSize: 30)),)),
      body: Padding(padding: EdgeInsets.all(7),
      child: transactionsList(transactions: cubit.transactions))
    );}, listener: (context,state){});
    throw UnimplementedError();
  }



  
}

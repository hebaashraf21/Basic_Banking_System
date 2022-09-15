import 'package:sparks_bank/modules/AboutScreen.dart';
import 'package:sparks_bank/modules/Transactions.dart';
import 'package:sparks_bank/modules/Users.dart';
import 'package:sparks_bank/modules/WelcomeScreen.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class BankCubit extends Cubit<BankSatates> {
  BankCubit() : super(initialStates());

  static BankCubit get(context) => BlocProvider.of(context);

  Database? db;

  List<Map> users = [];
  List<Map> transactions = [];
  List<Map> transactionsHistory = [];

  int currentIndex=0;

  List<Widget>Screens=[WelcomeScreen(),UsersScreen(),TransactionsScreen(),AboutScreen()];
  //List<String>Titles=["WELCOME to SPARKS BANK!","All users","All transactions","About us"];

   void ChangeNavBarIndex(int index)
  {
    currentIndex=index;
    emit(ChangeNavBar());
  }


  void navigateTo(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  bool recieverFound(String name,List<Map>users)
  {
    for(int i=0;i<users.length;i++)
    {
      if(users[i]['name']==name)
      {
        return true;
      }
    }
    return false;

  }

  int recieverIndex(String name,List<Map>users)
  {
    for(int i=1;i<users.length;i++)
    {
      if(users[i]['name']==name)
      {
        return i;
      }
    }
    return -1;
  }

  void CreateDataBase() {
    openDatabase('BankDBase', version: 1,
        onCreate: (Database db, int version) async {
      print("DB created");

      await db
          .execute(
              'CREATE TABLE Transactions (id INTEGER PRIMARY KEY, sender TEXT, reciever TEXT, amount INTEGER,datetime TEXT)')
          .then((value) {
        print("table of transactions created");
      }).catchError((err) {
        print("error ${err}");
      });

      await db
          .execute(
              'CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, amount INTEGER,phone TEXT,photourl TEXT)')
          .then((value) {
        print("table of users created");
      }).catchError((err) {
        print("error ${err}");
      });
    }, onOpen: (db) {
      GetDataOfUsers(db);
      emit(GetDataOfusers());
      GetDataOfTransactions(db);
      emit(GetDataOftransactions());
      print("db opened");
    }).then((value) {
      db = value;
      emit(CreateDB());
    });
  }

  void GetDataOfUsers(Database db) {
    users = [];
    db.rawQuery('SELECT * FROM Users').then((value) {
      emit(GetDataOfusers());
      value.forEach((element) {
        users.add(element);
      });
    });
  }

  void GetDataOfTransactions(Database db) {
    transactions = [];
    db.rawQuery('SELECT * FROM Transactions').then((value) {
      emit(GetDataOftransactions());
      value.forEach((element) {
        transactions.add(element);
      });
    });
  }

  //   void GetDataTransactionHistory(String name) {
  //   transactionsHistory = [];
  //   db?.rawQuery('SELECT * FROM Transactions WHERE sender= ? OR reciever= ?',['$name','$name']).then((value) 
  //   {
  //     emit(GetDataOftransactionshistory());
  //     value.forEach((element) {
  //       transactionsHistory.add(element);
  //     }
  //     );
  //   });
    
  // }

  Future history(String name)async
  {
    transactionsHistory=[];
    return await db?.transaction((txn) async{
      return await txn.rawQuery('SELECT * FROM Transactions WHERE sender= ? OR reciever= ?',['$name','$name']).then((value)
      {
        emit(GetDataOftransactionshistory());
      value.forEach((element) {
        transactionsHistory.add(element);
      }
      );

      });
    });

  }


  Future InsertIntoUsers(
      {required String name,
      required String email,
      required int amount,
      required String phone,
      required String url}) async {

    return await db?.transaction((txn) async {
      return await txn
          .rawInsert(
              'INSERT INTO Users(name,email,amount,phone,photourl) VALUES("$name", "$email", "$amount","$phone","$url")')
          .then((value) {
        print("user $name  $email $amount inserted");
        emit(InsertIntousers());
        GetDataOfUsers(db!);
        emit(GetDataOfusers());
      }).catchError((err) {
        print("error when insertion $err");
      });
    });
  }

  Future InsertIntoTransactions({
    required String sender,
    required String reciever,
    required int amount,
    required String datetime
  }) async {
    return await db?.transaction((txn) async {
      return await txn
          .rawInsert(
              'INSERT INTO Transactions(sender,reciever,amount,datetime) VALUES("$sender", "$reciever", "$amount","$datetime")')
          .then((value) {
        print("transaction $sender, $reciever, $amount,$datetime inserted");
        emit(InsertIntotransactions());
        GetDataOfTransactions(db!);
        emit(GetDataOftransactions());
        //GetDataTransactionHistory(sender);
        //emit(GetDataOftransactionshistory());
      }).catchError((err) {
        print("error when insertion $err");
      });
    });
  }




  void UpdateSenderDB({
  required int amount,
  required String sender,
})
{
  db?.rawUpdate('UPDATE Users Set amount= ? WHERE name= ?',['$amount','$sender']).then((value){
    print("sender updated");
    emit(UpdateSender());
    GetDataOfUsers(db!);
    emit(GetDataOfusers());
  });

}

 void UpdateRecieverDB({
  required int amount,
  required String reciever,
})
{
  db?.rawUpdate('UPDATE Users Set amount= ? WHERE name= ?',['$amount','$reciever']).then((value){
    print("reciever updated");
    emit(UpdateReciever());
    GetDataOfUsers(db!);
    emit(GetDataOfusers());
  });

}

void refresh()
{
  GetDataOfUsers(db!);
}


}






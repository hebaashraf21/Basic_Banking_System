import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sparks_bank/modules/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:sparks_bank/shared/Components/constants.dart';




Widget defaultTextButton({

  required Function ontap,
  required String text,

})
{
  return TextButton(onPressed: (){ontap;}, child: Text("$text"));

}  


Widget defaultTextFormField(
  {
    required TextEditingController controller,
    required TextInputType keyboaredType,
    required IconData prefix,
    required String Label,
    required FormFieldValidator validator,
    Function? onSubmitted,
    GestureTapCallback? ontap, 
    IconData? suffix,
    bool? obsecure=false,

  }
)
{
  return TextFormField(
    controller: controller,
    keyboardType:keyboaredType,
    obscureText: obsecure!,
    maxLines: 1,
    enableSuggestions: true,
    onFieldSubmitted:(s){onSubmitted!();} ,
    onTap: ontap,
    validator: validator,
    decoration:InputDecoration(
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix),
      labelText: Label,
      //border: OutlineInputBorder(),
    ) ,
    
  );
}

Widget userItem(Map user,context)
{
  return Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            children: [
              Text("${user['id']}",style: TextStyle(color: secondary,fontSize: 25,fontFamily: 'Lobster'),),
              // CircleAvatar(
              //   radius: 20,
              //   backgroundColor: secondary,
              //   child: Center(child: Text("${user['id']}",style: TextStyle(color: Colors.white,fontSize: 15),),)
              // ),
              SizedBox(width: 30,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${user['name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: primary,),),
                  SizedBox(height:6),
                  Text("${user['email']}"),

                ],
              )),
              SizedBox(width: 10,),
              Text("${user['amount']} EGP",style:TextStyle(fontWeight: FontWeight.bold) ,),
              SizedBox(width: 20,),
              IconButton(onPressed: ()async
              {
                 await Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(user)));
                
              }, icon: Icon(Icons.view_agenda_outlined,),),

            ],
          ),);
}

Widget transactionItem(Map transaction,context)
{
  return Padding(padding: EdgeInsets.all(20),
          child: Center(
            child: Row(
            children: [

              Text("${transaction['sender']} ",style:TextStyle(fontWeight: FontWeight.bold) ,),
              Spacer(),
              Icon(Icons.arrow_right_alt_sharp),
              Spacer(),
              Text("${transaction['reciever']}",style:TextStyle(fontWeight: FontWeight.bold) ,),
              Spacer(),
              TextButton(onPressed: (){
                _displayTextInputDialog(context, transaction['amount'], transaction['datetime'], transaction['sender'], transaction['reciever']);
              }, child: Text("Datails",style: TextStyle(color: secondary),)),

            ],
          ),
          ));
}


Widget transactionsList({required List<Map>transactions})
{
  if(transactions.length>0)
  {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return transactionItem(transactions[index], context);
        }),
       separatorBuilder: (context,index){
        return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),);
       },


        itemCount: transactions.length);
  }
  else
  {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          'No Transactions Yet.',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
          ],
        ),
      
);
  }
}



Widget usersList({required List<Map>users})
{
  
  if(users.length>0)
  {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return userItem(users[index], context);
        }),
       separatorBuilder: (context,index){
        return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),);
       },


        itemCount: 15);
  }
  else
  {
    return Center(
      child: LoadingIndicator(
    indicatorType: Indicator.ballClipRotateMultiple, /// Required, The loading type of the widget
    colors: const [Color.fromARGB(255, 84, 218, 158)],       /// Optional, The color collections
    strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
    backgroundColor: Colors.white,      /// Optional, Background of the widget
    pathBackgroundColor: primary,    /// Optional, the stroke backgroundColor
)

      );
  }
}


Future<void> _displayTextInputDialog(BuildContext context,int transactionamount,String transactiondate,String sender,String reciever) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Transaction details',style:TextStyle(fontWeight: FontWeight.w100,color: primary,fontFamily: 'Lobster',fontSize: 20),),
          content: SingleChildScrollView(

            child:Container(
            height: 150,

            child:
                SizedBox(
                  height: 400,
                  width: 200,
                  child: ListView(
                  children: [

                    Row(
                      children: [
                        Text("Sender:",style: TextStyle(color: secondary,fontWeight: FontWeight.w600,fontSize: 15)),
                        SizedBox(width: 10,),
                        Text("${sender}")
                      ],
                    ),

                    SizedBox(height:5),

                                      Row(
                      children: [
                        Text("Reciever:",style: TextStyle(color: secondary,fontWeight: FontWeight.w600,fontSize: 15)),
                        SizedBox(width: 10,),
                        Text("${reciever}")
                      ],
                    ),
                    SizedBox(height:5),
                                      Row(
                      children: [
                        Text("Amount:",style: TextStyle(color: secondary,fontWeight: FontWeight.w600,fontSize: 15)),
                        SizedBox(width: 10,),
                        Text("${transactionamount}")
                      ],
                    ),
SizedBox(height:5),
                                      Row(
                      children: [
                        Text("Date&Time:",style: TextStyle(color: secondary,fontWeight:FontWeight.w600,fontSize: 15)),
                        SizedBox(width: 1,),
                        Text("${transactiondate}")
                      ],
                    ),
                  ],
                ),)

          ) ,
          ),

            actions: <Widget>[
               GredientButton(
              onPressed: (){
                Navigator.pop(context);
              },
                  splashColor: Color.fromARGB(255, 42, 238, 192),
                  colors: [
                       primary,
                    secondary                  
                  ], title: "    OK  ",),
  
           ],

        );
      });
}





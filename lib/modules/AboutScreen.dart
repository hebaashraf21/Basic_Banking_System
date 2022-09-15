import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sparks_bank/shared/Components/constants.dart';


class AboutScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("About us",style:TextStyle(fontWeight: FontWeight.w100,color: primary,fontFamily: 'Lobster',fontSize: 30)),)),
      body: Padding(padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          
          children: [
                        Container(
              width: double.infinity,
              height: 1,
              color: secondary,
            ),
            SizedBox(height:30),
            Text("OUR VISION",style:TextStyle(fontWeight: FontWeight.w100,color: secondary,fontFamily: 'Lobster',fontSize: 30)),
            SizedBox(height:10),
            Text("Our distinguished performance guarantees us the leadership we deserve.",style:TextStyle(fontWeight: FontWeight.bold,color: primary,fontSize: 17)),
            SizedBox(height:20),
            Text("OUR MISIION",style:TextStyle(fontWeight: FontWeight.w100,color: secondary,fontFamily: 'Lobster',fontSize: 30)),
            SizedBox(height:10),
            Text("Excellence in fulfilling all of our customers' banking needs, maximizing the value of shareholders, inspiring employees' loyalty and  playing a leading role in the prosperity and development of Egypt.",style:TextStyle(fontWeight: FontWeight.bold,color: primary,fontSize: 17)),
            SizedBox(height:20),
            Text("OUR VALUES",style:TextStyle(fontWeight: FontWeight.w100,color: secondary,fontFamily: 'Lobster',fontSize: 30)),
            Text("Customer Centricity, Agility, Pride, Innovation, Stewardship",style:TextStyle(fontWeight: FontWeight.bold,color: primary,fontSize: 17)),
            SizedBox(height:30),
            Container(
              width: double.infinity,
              height: 1,
              color: secondary,
            ),
            SizedBox(height: 10,),
            Text("Contact us",style:TextStyle(fontWeight: FontWeight.w100,color: secondary,fontFamily: 'Lobster',fontSize: 20)),
            SizedBox(height:5),
            Row(
              children: [
                Icon(Icons.call),
                SizedBox(width: 5,),
                Text("0112394"),

              ],
            ),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 5,),
                Text("sparks@gmail.com")

              ],
            )

          ],
        ),
      ),),
    );
    throw UnimplementedError();
  }

}
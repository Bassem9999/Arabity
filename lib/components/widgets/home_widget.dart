
import 'package:arabity/components/functions.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  String text;
  var icon;
  Widget destination;
   HomeWidget({super.key,required this.text,required this.icon,required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black.withOpacity(0.7),
                ),
              child: InkWell(
                child: GridTile(child: Column(children: <Widget>[
                  Container(margin: const EdgeInsets.only(top: 20),child: Icon(icon,size: 70,color: Colors.lightBlueAccent,)),
                  Container(margin: const EdgeInsets.only(top: 20),
                  child: Text(text,style: const TextStyle(color:Colors.lightBlueAccent,fontSize: 20 ),))
                ],)),
              onTap: (){
               myPushNavigator(context, destination);
              },
              ),
            );
  }
}
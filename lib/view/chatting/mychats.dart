import 'package:arabity/components/widgets/drawer_widget.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  final String sendFrom;
  final String sendTo;
  final String recieverId;
  const ChatsList({super.key,required this.sendFrom, required this.sendTo, required this.recieverId});


  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("المحادثات"),
            centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
          future:cubit.getMyChats(sendFrom: sendFrom),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
               return ListView.builder( itemCount: snapshot.data.length, itemBuilder:(context,i){
              return Row(children: [
                Text(snapshot.data[i]['sendFrom'])
              ],);
            });
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }       
          }
          )
          ),
    );
    
  }
}

 
 
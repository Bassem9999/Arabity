
import 'package:arabity/components/widgets/textfield_widget.dart';
import 'package:arabity/model/chats_model.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/utils/controllers.dart';
import '../../components/utils/functions.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  String sendFrom;
  String sendTo;
  String recieverId;
   ChatPage({super.key,required this.sendFrom, required this.sendTo, required this.recieverId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("المحادثة",style: TextStyle(fontSize: 25),),
            centerTitle: true,
          ),
          body: Form(
            key: chatForm,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(children: [
                Expanded(
                  child: FutureBuilder(
                      future: cubit.getmessages(sendFrom: sendFrom, sendTo: sendTo),
                      builder: (BuildContext context,AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          controller: chatScrollController,
                          itemBuilder: (context, int i) {
                            ChatsModel chatsModel = ChatsModel.fromJson(snapshot.data[i]);
                            return Row(
                              mainAxisAlignment: chatsModel.sendFrom == sendFrom? MainAxisAlignment.start : MainAxisAlignment.end,
                              children: [
                               // snapshot.data[i]['sendFrom'] == sendFrom? const Text("") : const Spacer(),
                                Container(
                                  width: 150,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: chatsModel.sendFrom == sendFrom? Colors.blue : const Color.fromARGB(255, 109, 109, 109) ,
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(20),
                                          bottomLeft: chatsModel.sendFrom == sendFrom? const Radius.circular(20) : Radius.zero,
                                          topRight: const Radius.circular(20),
                                          bottomRight: chatsModel.sendFrom == sendFrom? Radius.zero : const Radius.circular(20) 
                                          )),
                                  child: Text(chatsModel.message.toString(),
                                          style: const TextStyle(fontSize: 18,color: Colors.white,),
                                          maxLines: 5),
                                ),
                              ],
                            );
                          },  
                                                );
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      }),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed:(){
                            cubit.sendMessage(sendFrom: sendFrom,sendTo: sendTo, recieverId: recieverId);
                          },
                          icon: const Icon(
                            Icons.send,
                            textDirection: TextDirection.ltr,
                          )),
                      Expanded(
                          child: UnroundedTextFieldWidget(
                              label: "الرسالة",
                              mycontroller: message,
                              myval: myvalEmail,
                              isPassword: false)),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}


import 'package:arabity/components/controllers.dart';
import 'package:arabity/components/functions.dart';
import 'package:arabity/components/widgets/textfield_widget.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  String sendFrom;
  String sendTo;
   ChatPage({super.key,required this.sendFrom, required this.sendTo});

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
                            return Row(
                              mainAxisAlignment: snapshot.data[i]['sendFrom'] == sendFrom? MainAxisAlignment.start : MainAxisAlignment.end,
                              children: [
                               // snapshot.data[i]['sendFrom'] == sendFrom? const Text("") : const Spacer(),
                                Container(
                                  width: 150,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: snapshot.data[i]['sendFrom'] == sendFrom? Colors.blue : const Color.fromARGB(255, 109, 109, 109) ,
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(20),
                                          bottomLeft: snapshot.data[i]['sendFrom'] == sendFrom? const Radius.circular(20) : Radius.zero,
                                          topRight: const Radius.circular(20),
                                          bottomRight: snapshot.data[i]['sendFrom'] == sendFrom? Radius.zero : const Radius.circular(20) 
                                          )),
                                  child: Text(snapshot.data[i]['message'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
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
                            cubit.sendMessage(sendFrom: sendFrom,sendTo: sendTo);
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

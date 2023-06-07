// ignore_for_file: prefer_const_constructors
import 'package:arabity/view/auth/signup.dart';
import 'package:arabity/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

import '../../components/utils/constants.dart';
import '../../components/utils/controllers.dart';
import '../../components/utils/functions.dart';
import '../../components/widgets/textfield_widget.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return WillPopScope(
      onWillPop: (){
       return showdialog(context, "هل تريد اغلاق التطبيق ؟", null,[
        TextButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: Text("نعم",style: TextStyle(color: Colors.white,fontSize: 18),)),

        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: Text("لا",style: TextStyle(color: Colors.white,fontSize: 18)))
       ], Colors.grey);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("تسجيل دخول",style: TextStyle(fontSize: 22),),
            centerTitle: true, 
          ),
          body: Container(
            decoration: BoxDecoration(
              image: appBgImage,
            ),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 30,),
                Container(
                   margin: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                     height: 420,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)
                        ),
                   child: Form(
                       key: formstatelogin,
                     child: Column(
                      children: <Widget>[
    
                  Container(
                     padding: EdgeInsets.symmetric(vertical: 25),
                     child: Center(child: Text("تسجيل دخول",style: TextStyle(color:Colors.white ,fontSize: 30,fontWeight: FontWeight.bold),)),
                   ),
                              
                   TextFieldWidget(label: "Email", suffex: Icons.email_outlined, mycontroller: loginEmail, myval: myvalEmail, isPassword: false),
                   TextFieldWidget(label: "Password", suffex: Icons.lock_outline, mycontroller: loginPassword, myval: myvalPassword, isPassword: true),
               
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 200,
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text("تسجيل دخول",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                      onTap: () {
                        cubit.login(context);
                      },
                    ),
    
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                           child: Text("انشاء حساب",style: TextStyle(color:Colors.blue,fontSize: 17,decoration: TextDecoration.underline)),
                           onTap: (){
                             myReplaceNavigator(context, Signup());
                           },
                         ),
                         SizedBox(width: 5,),
                         Text("لا املك حساب",style: TextStyle(color:Colors.white,fontSize: 17)),
                      ],
                    ),
                  ),   
                       ],
                     ),
                   ),
                 )
              ],
            ),
          ),
        ),
    );
    
  }
}



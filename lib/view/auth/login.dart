// ignore_for_file: prefer_const_constructors
import 'package:arabity/components/constants.dart';
import 'package:arabity/view/auth/signup.dart';
import 'package:arabity/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../../components/controllers.dart';
import '../../components/functions.dart';
import '../../components/widgets/textfield_widget.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to My Car"),
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
                   height: 400,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20)
                      ),
                 child: Form(
                     key: formstatelogin,
                   child: Column(
                    children: <Widget>[

                Container(
                   padding: EdgeInsets.symmetric(vertical: 30),
                   child: Center(child: Text("Login",style: TextStyle(color:Colors.white ,fontSize: 30,fontWeight: FontWeight.bold),)),
                 ),
                            
                 TextFieldWidget(label: "Email", suffex: Icons.email_outlined, mycontroller: loginEmail, myval: myvalEmail, isPassword: false),
                 TextFieldWidget(label: "Password", suffex: Icons.lock_outline, mycontroller: loginPassword, myval: myvalPassword, isPassword: true),
          
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: (){
                      showcircle(context);
                     cubit.login(context);
                    },
                  //  color: Colors.blue,
                    ),
                  ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: InkWell(
                     child: Center(child: Text("Create Account",
                     style: TextStyle(color:Colors.blue,decoration: TextDecoration.underline),
                     )),
                     onTap: (){
                       myReplaceNavigator(context, Signup());
                     },
                   ),
                ),   
                     ],
                   ),
                 ),
               )
            ],
          ),
        ),
      );
    
  }
}



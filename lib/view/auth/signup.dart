
import 'package:flutter/material.dart';
import '../../components/constants.dart';
import '../../components/controllers.dart';
import '../../components/functions.dart';
import '../../components/widgets/textfield_widget.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import '../auth/login.dart';

class Signup extends StatelessWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("انشاء حساب",style: TextStyle(fontSize: 22),),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: appBgImage,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 AnimatedContainer(
                   duration:const Duration(milliseconds: 900,),
          
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                     height: 650,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)
                        ),
                   child: Form(
                      key: formstatesignup,
                     child: Column(
                       children: <Widget>[
          
          
          
                    Container(
                     padding: const EdgeInsets.symmetric(vertical: 25),
                     child: const Center(child: Text("انشاء حساب",style: TextStyle(color:Colors.white ,fontSize: 30,fontWeight: FontWeight.bold),)),
                    ),
          
          
                    TextFieldWidget(label: "name", suffex: Icons.email_outlined, mycontroller: signupName, myval: myvalEmail, isPassword: false),
                    TextFieldWidget(label: "Email", suffex: Icons.lock_outline, mycontroller: signupEmail, myval: myvalEmail, isPassword: false),
                    TextFieldWidget(label: "phone", suffex: Icons.email_outlined, mycontroller: signupPhone, myval: myvalEmail, isPassword: false),
                    TextFieldWidget(label: "Password", suffex: Icons.lock_outline, mycontroller: signupPassword, myval: myvalPassword, isPassword: true),
                    TextFieldWidget(label: "Confirm Password", suffex: Icons.lock_outline, mycontroller: signupConfirmpassword, myval: myvalConfirmPassword, isPassword: true),
                  
                   InkWell(
                      child: Container(
                        height: 45,
                        width: 200,
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Text("انشاء حساب",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                      onTap: () {
                        cubit.signup(context);
                      },
                    ),
                     SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        
                         InkWell(
                                 child: const Center(child: Text("تسجيل دخول",
                                 style: TextStyle(color:Colors.blue,fontSize: 17,decoration: TextDecoration.underline),
                                 )),
                                 onTap: (){
                                   myReplaceNavigator(context, const Login());
                                 },
                               ),
                         SizedBox(width: 5,),
                         Text("املك حساب بالفعل",style: TextStyle(color:Colors.white,fontSize: 17)),     
                       ],
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

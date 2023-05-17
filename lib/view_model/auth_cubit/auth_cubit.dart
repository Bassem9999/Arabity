import 'package:arabity/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/controllers.dart';
import '../../components/functions.dart';
import '../../repositories/auth_repo.dart';
import '../../view/home/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
 
   static AuthCubit get(context) => BlocProvider.of(context);
   final AuthRepo _authRepo = AuthRepo();
   


   bool isVisible = false;

   void passwordVisibility(){
    isVisible = !isVisible;
    emit(PasswordVisibilityState());
   }


   login(context) async {
      try{
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var formdata = formstatelogin.currentState;
          formdata!.save();
          if(formdata.validate()){
            var myresponse = await _authRepo.loginResponse();
            if(myresponse['status']== true){
                  myReplaceNavigator(context, const Home());
                  snackbar(context, myresponse['message'], Colors.green);
                  print("success");
                  preferences.setString('phone', myresponse['data'][0]['phone'].toString());
                  print(preferences.getString('phone').toString());
                 await FirebaseMessaging.instance.subscribeToTopic("users").then((value) {
                  print("subscribed To Users");
                 });
                 await FirebaseMessaging.instance.subscribeToTopic("users${myresponse['data'][0]['id'].toString()}").then((value){
                  print("subscribed To UserId");
                  });
            }
            else{
              snackbar(context, myresponse['message'], Colors.red);
              print(myresponse['message']);
              print("failed");  
            }
        }
      }

      catch(e){
        print(e);
        print(e);
      }
    }



  signup(context) async {
   try{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var formdata = formstatesignup.currentState;
    formdata!.save();
    if(formdata.validate()){
      showcircle(context);
      var myresponse = await _authRepo.signupResponse();
      if(myresponse['status']== true){
            myReplaceNavigator(context, const Home());
            snackbar(context, myresponse['message'], Colors.green);
            print("success");
            await preferences.setString('id', myresponse['data'][0]['id'].toString());
            await preferences.setString('name', myresponse['data'][0]['name'].toString());
            await preferences.setString('email', myresponse['data'][0]['email'].toString());
            await preferences.setString('phone', myresponse['data'][0]['phone'].toString());
            await FirebaseMessaging.instance.subscribeToTopic("users").then((value) {
              print("Subscribed To Users");
              });
              await FirebaseMessaging.instance.subscribeToTopic("user${preferences.getString('id')}").then((value){
              print("Subscribed To UserId");
              });
          //  setpref(myresponse['data']['email']);
            
      }
      else{
        snackbar(context, myresponse['message'], Colors.red);
        print("failed");  
    }
    }
   }
   catch(e){
        print(e);
      }
   
 }


 logout(context)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await FirebaseMessaging.instance.unsubscribeFromTopic("users").then((value) {
    print("Unsubscribed To Users");
  });
  await FirebaseMessaging.instance.unsubscribeFromTopic("user${preferences.getString('id')}").then((value){
    print("Unsubscribed To UserId");
  });
  await preferences.clear();
  myReplaceNavigator(context,const Login());
 

 }

}


//010 49 37 45 756
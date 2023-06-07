import 'package:arabity/view/auth/login.dart';
import 'package:arabity/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view_model/app_cubit/app_cubit.dart';
import 'view_model/auth_cubit/auth_cubit.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool islogin = false;
  if(preferences.getString('phone') != null){
    islogin = true;
  }
  runApp( MyApp(islogin: islogin,));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool islogin;
  MyApp({super.key, required this.islogin});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => AuthCubit(),),
         BlocProvider(create: (context) => AppCubit()..notifyPermission()..fillUserData()..createDatabase()..fillBrandsList(),),
      ],
      child: MaterialApp(
        title: 'Arabity',

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: islogin? const Home() : const Login(),
      ),
    );
  }
}

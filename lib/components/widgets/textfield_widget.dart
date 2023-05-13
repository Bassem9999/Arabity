import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/auth_cubit/auth_cubit.dart';


class TextFieldWidget extends StatelessWidget {
  String label;
  var suffex;
  bool isPassword;
  var myval;
  TextEditingController mycontroller;
  TextFieldWidget({super.key,
   required this.label,
   required this.suffex,
   required this.mycontroller,
   required this.myval,
   required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
    var cubit = AuthCubit.get(context);
    return  Container(
      //height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: TextFormField(
        controller: mycontroller,
        validator: myval,
        obscureText: isPassword? cubit.isVisible? false : true : false,
        obscuringCharacter: "*",
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.7),
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(suffex),
          suffixIcon: isPassword? IconButton(icon:Icon(cubit.isVisible?Icons.visibility_outlined : Icons.visibility_off_outlined),
          onPressed: cubit.passwordVisibility,
          ) : null ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
    });
  }
}


class UnroundedTextFieldWidget extends StatelessWidget {
  String label;
  bool isPassword;
  var myval;
  TextEditingController mycontroller;
  UnroundedTextFieldWidget({super.key,
   required this.label,
   required this.mycontroller,
   required this.myval,
   required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
    var cubit = AuthCubit.get(context);
    return  Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
      child: TextFormField(
        controller: mycontroller,
        validator: myval,
        obscureText: isPassword? cubit.isVisible? false : true : false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          suffixIcon: isPassword? IconButton(icon:Icon(cubit.isVisible?Icons.visibility_outlined : Icons.visibility_off_outlined),
          onPressed: cubit.passwordVisibility,
          ) : null ,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
    );
    });
  }
}




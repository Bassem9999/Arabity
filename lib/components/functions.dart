import 'package:flutter/material.dart';
import 'controllers.dart';

myPushNavigator(context, screen) {
 // return Navigator.of(context).push(SlideRoute(page: screen));
 return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
}

myReplaceNavigator(context, screen) {
  return Navigator.maybeOf(context)!.pushReplacement(MaterialPageRoute(builder: (context) => screen));
}


showdialog(context, String text, var content, var color) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          content: content,
          backgroundColor: color,
        );
      });
}

snackbar(context, String message,Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}

 showcircle(context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog( 
        title: Row(
          children: [
            Text(" Loading ....    ",style: TextStyle(color: Colors.white),),
            CircularProgressIndicator(),
          ],
        ),
        backgroundColor: Colors.grey,    
      );
    }
    );
    }

String? myvalEmail(text) {
  if (text.trim().isEmpty) {
    return "This field mustn't be empty";
  }
}

String? myvalPassword(text) {
  if (text.trim().isEmpty) {
    return "This field mustn't be empty";
  } else if (text.trim().length < 6) {
    return "Password should be 6 characters or more";
  }
}

String? myvalConfirmPassword(text) {
  if (text.trim().isEmpty) {
    return "This field mustn't be empty";
  } 
  else if (text != signupPassword.text) {
    return "Passwords is not the same ";
  }
}

 

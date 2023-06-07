import 'dart:convert';

import 'package:http/http.dart' as http;

import '../components/utils/constants.dart';
import '../components/utils/controllers.dart';

class AuthRepo{

Future loginResponse()async{
var data = {'email' : loginEmail.text , 'password' : loginPassword.text};
var url = "$baseUrl/login.php";  
var response = await http.post(Uri.parse(url),body: data);
var responsebody = jsonDecode(response.body);
print(responsebody);
return responsebody;
}


Future signupResponse()async{
var data = {'name' : signupName.text , 'email' : signupEmail.text , 'phone' : signupPhone.text , 'password' : signupPassword.text};
var url = "$baseUrl/signup.php";
var response = await http.post(Uri.parse(url),body: data);
var responsebody = jsonDecode(response.body);
return responsebody;
}
}
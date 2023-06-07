import 'dart:convert';

import 'package:http/http.dart' as http;

import '../components/utils/constants.dart';

class ChatRepo{

Future fetchChatMessagesResponse(data)async{
  var url = "$baseUrl/getmessages.php";  
  var response = await http.post(Uri.parse(url),body: data);
  var responsebody = jsonDecode(response.body);
  print(responsebody);
  return responsebody;
}




Future addChatMeassageResponse(data)async{
    var url = "$baseUrl/addmessage.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
}

Future fetchmyChatsResponse(data)async{
  var url = "$baseUrl/getmychats.php";  
  var response = await http.post(Uri.parse(url),body: data);
  var responsebody = jsonDecode(response.body);
  print(responsebody);
  return responsebody;
}


}
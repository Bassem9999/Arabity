import 'dart:convert';

import 'package:http/http.dart' as http;

import '../components/utils/constants.dart';

class CarsRepo{

Future fetchCarsResponse()async{
  var url = "$baseUrl/cars.php";  
  var response = await http.get(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  print(responsebody);
  return responsebody;
}




Future addCarResponse(data)async{
    var url = "$baseUrl/addcar.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
}


}
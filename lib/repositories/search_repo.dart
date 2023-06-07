import 'dart:convert';

import 'package:http/http.dart' as http;

import '../components/utils/constants.dart';

class SearchRepo{


Future searchCarResponse(data)async{
    var url = "$baseUrl/search.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
}


}
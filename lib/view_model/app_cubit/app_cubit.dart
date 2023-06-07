
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:arabity/data/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arabity/repositories/cars_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import '../../components/utils/controllers.dart';
import '../../components/utils/functions.dart';
import '../../components/utils/service.dart';
import '../../repositories/chat_repo.dart';
import '../../repositories/search_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  CarsRepo carsRepo = CarsRepo();
  SearchRepo searchRepo = SearchRepo();
  ChatRepo chatRepo = ChatRepo();
  
  List<XFile?> images_files = [];
  List<String> images_64 = [];
  List images_names = [];
  Database? database;
  List<Map> favourites = [];
  List favouriteCarId = [];
  List brandsList = [];
  List modelsList = [];
  List searchModelsList = [];
  String date = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  String carAdditions = "";
  bool airCondition = false;
  bool leather = false;
  bool mirrors = false;
  bool power = false;
  bool remoteController = false;
  bool autoPark = false;
  bool frontWindows = false;
  bool backWindows = false;
  bool fameGlass = false;
  bool blutouth = false;
  bool aux = false;
  bool usb = false;
  bool sensors = false;
  bool driverAirbags = false;
  bool passangersAirbags = false;
  bool abs = false;
  bool ebd = false;
  bool imoblayser = false;
  bool speedController = false;
  bool centerLock = false;
  bool alarm = false;
  bool lights = false;
  bool backCamera = false;

 void update()async{
  emit(UpdateState());
 }
 
  notifyPermission()async{
    await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
);
  }

fcmConfig(context){
  FirebaseMessaging.onMessage.listen((message) { 
    snackbar(context, "${message.notification!.body}", Colors.grey);
  print(message.notification!.body);
  });
}

 void fillUserData()async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   UserData.userId = preferences.getString('id');
   UserData.userName = preferences.getString('name');
   UserData.userEmail = preferences.getString('email');
   UserData.userPhone = preferences.getString('phone');
 }


 void addCarAdditions(String addition,bool value, int controllerId){
   if(carAdditions.contains(addition)){
     carAdditions = carAdditions.replaceAll(addition, "");
   }else{
    carAdditions = carAdditions + addition;
   }
   switch(controllerId){
    case 1 : airCondition = value; break;
    case 2 : leather = value; break;
    case 3 : mirrors = value; break;
    case 4 : power = value; break;
    case 5 : remoteController = value; break;
    case 6 : autoPark = value; break;
    case 7 : frontWindows = value; break;
    case 8 : backWindows = value; break;
    case 9 : fameGlass = value; break;
    case 10 : blutouth = value; break;
    case 11 : aux = value; break;
    case 12 : usb = value; break;
    case 13 : sensors = value; break;
    case 14 : driverAirbags = value; break;
    case 15 : passangersAirbags = value; break;
    case 16 : ebd = value; break;
    case 17 : abs = value; break;
    case 18 : imoblayser = value; break;
    case 19 : speedController = value; break;
    case 20 : centerLock = value; break;
    case 21 : alarm = value; break;
    case 22 : lights = value; break;
    case 23 : backCamera = value; break;
   }
   emit(SwitchButtonState());
    print(carAdditions);
   }


 

 Future pickimages(context) async {
     images_files.clear();
     images_names.clear();
     images_64.clear();
     final List<XFile> pickedImage = await ImagePicker().pickMultiImage();
     if(pickedImage.isNotEmpty && pickedImage.length < 8){
      images_files.addAll(pickedImage);
      for(var i in images_files){
        Uint8List imagebytes = await i!.readAsBytes();
        images_64.add(base64Encode(imagebytes));
        images_names.add(i.path.split("/").last);
      }
       emit(PickImageState());

     }else{
      snackbar(context, "please choose 7 images Maximum", Colors.red);
      emit(PickImageState());
     }
  }

 

 uploadCar(context) async {
  SharedPreferences preferences =await SharedPreferences.getInstance();
  var formData = formstateAddCar.currentState;
  formData!.save();
  if(formData.validate()){
    if (images_files.isNotEmpty){
      showcircle(context);
      var myResponse = await carsRepo.addCarResponse(
         {
        'ownerId': preferences.getString('id'),
        'owner': carOwnername.text,
        'phone': carOwnerPhone.text,
        'city': city,
        'brand' : brand,
        'model': model,
        'color': carColor.text,
        'price': carPrice.text,
        'trans': transimition,
        'km': carKm.text,
        'year': carYear.text,
        'additions' : carAdditions,
        'info': carInfo.text,
        'imageName_1': images_files.isNotEmpty ? images_names[0] : "",
        'imageName_2': images_files.length > 1 ? images_names[1] : "",
        'imageName_3': images_files.length > 2 ? images_names[2] : "",
        'imageName_4': images_files.length > 3 ? images_names[3] : "",
        'imageName_5': images_files.length > 4 ? images_names[4] : "",
        'imageName_6': images_files.length > 5 ? images_names[5] : "",
        'imageName_7': images_files.length > 6 ? images_names[6] : "",
        'image64_1': images_files.isNotEmpty ? images_64[0] : "",
        'image64_2': images_files.length > 1 ? images_64[1] : "",
        'image64_3': images_files.length > 2 ? images_64[2] : "",
        'image64_4': images_files.length > 3 ? images_64[3] : "",
        'image64_5': images_files.length > 4 ? images_64[4] : "",
        'image64_6': images_files.length > 5 ? images_64[5] : "",
        'image64_7': images_files.length > 6 ? images_64[6] : "",
        'date' : date,
      }
      );

      if (myResponse['status'] == true) {
      snackbar(context, myResponse['message'], Colors.green);
      images_files.clear();
      images_names.clear();
      images_64.clear();
      carOwnername.text = carOwnerPhone.text = carColor.text = carPrice.text = carKm.text = carYear.text = carInfo.text = "";
      Navigator.pop(context);
      emit(AddCarState());
      } else {
       snackbar(context, myResponse['message'], Colors.red);
       Navigator.pop(context);
       emit(AddCarState());
      }
    }else{
      snackbar(context,"Please choose car images", Colors.red);
    }
  }
  }



  void createDatabase(){
  openDatabase('favouritecars.db',
  version: 2,
  onCreate: (database, version) {
  database.execute("CREATE TABLE favourites(id INTEGER PRIMARY KEY,owner TEXT,phone TEXT,brand TEXT,model TEXT,city TEXT,color TEXT,price INTEGER,trans TEXT,km TEXT,year TEXT,info TEXT,photo1 TEXT,photo2 TEXT,photo3 TEXT,photo4 TEXT,photo5 TEXT)").then((value) {
    print("table created");
  },);
    print("database created");
  },
  onOpen: (database){
    print('database opened');
    getLocalData(database);
  },
  ).then((value) {
    database = value;
    emit(FavouriteState());
  });
 // return getLocalData(database);
}

void addToLocalFav({required String owner, required String phone,required String brand,required String model,required String city,required String color,required int price,required String trans,required String km,required String year,required String info,required String photo1,required String photo2,required String photo3,required String photo4,required String photo5}){
  database!.transaction((txn)async{
    await txn.rawInsert('INSERT INTO favourites(owner,phone,brand,model,city,color,price,trans,km,year,info,photo1,photo2,photo3,photo4,photo5) VALUES("$owner","$phone","$brand","$model","$city","$color","$price","$trans","$km","$year","$info","$photo1","$photo2","$photo3","$photo4","$photo5")').then((value){
      print('$value data inserted');
       getLocalData(database);
       emit(FavouriteState());
    });
  });
}


 void getLocalData(database){
  favouriteCarId.clear();
  database!.rawQuery('SELECT * FROM favourites').then((value) {
    favourites = value;
    for(var item in value){
       favouriteCarId.add(item['brand']);
    }
    // favourites.forEach((e){
    //   favouriteProducts.add(e['productName']);
    // });
     print(favouriteCarId);
     emit(FavouriteState());
  });
}


void deletefromLocalFav({required int id})async{
    database!.rawUpdate("DELETE FROM favourites WHERE id =?",[id]).then((value){
       getLocalData(database);
       emit(FavouriteState());
    });
  }

  void fillBrandsList(){
    for(var item in brandsJson){
      brandsList.add(item['brand']);
    }
  }

  void fillModelsList(){
      model = null;
      searchModel = null;
      modelsList = [];
      searchModelsList = [];
      for(var item in brandsJson){
        if(item['brand'] == brand){
         modelsList = item['models'];
        }
        else if(item['brand'] == searchBrand ){
          searchModelsList = item['models'];
        }
      }
  }

  searchForCar()async{
    try{
    var searchedCars = await searchRepo.searchCarResponse({
     'brand' : searchBrand?? "",
     'model' : searchModel?? "",
     'trans' : searchTransimition?? "" ,
     'city' : searchCity?? "",
    'priceFrom' : priceFrom.text,
    'priceTo' : priceTo.text,
    'yearFrom' : yearFrom.text,
    'yearTo' : yearTo.text,
   });
   return searchedCars;
    }catch(e){
      print(e.toString());
    }
   
  }

  getCarsList()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List carsList = [];
    await carsRepo.fetchCarsResponse().then((value) {
      for(var i in value){
        if(i['ownerId'] != preferences.getString('id')){
          carsList.add(i);
        }
      }
    });
    return carsList;

  }

  Future getMyChats({required String sendFrom})async{
    List chatsNumbers = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await chatRepo.fetchmyChatsResponse({
        'sendFrom' : sendFrom,
    }).then((value) {
      for(var item in value){
        if(item['sendFrom'] != preferences.getString('phone') && chatsNumbers.contains(item['sendFrom']) == false){
           chatsNumbers.add(item['sendFrom']);
        }
        else if(item['sendTo'] != preferences.getString('phone') && chatsNumbers.contains(item['sendTo']) == false){
          chatsNumbers.add(item['sendTo']);
        }
      }
  });
  return chatsNumbers;
//  emit(GetChatMessagesState());
 //  return messages;
  }

  Future getmessages({required String sendFrom , required String sendTo})async{
  var messages = await chatRepo.fetchChatMessagesResponse({
      'sendFrom' : sendFrom,
      'sendTo' : sendTo,
  });
  emit(GetChatMessagesState());
   return messages;
  }

  void sendMessage({required String sendFrom , required String sendTo, required String recieverId})async{
    var formData = chatForm.currentState;
    formData!.save();
    if(formData.validate()){
     await chatRepo.addChatMeassageResponse({
      'sendFrom' : sendFrom,
      'sendTo' : sendTo,
      'recieverId' : recieverId,
      'message' : message.text,
      'time' : date,
    });
    message.text = "";
   Future.delayed(Duration(seconds: 2),(){
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeInOutBack); 
   });
    emit(AddChatMessagesState());
    }
  }




}
 


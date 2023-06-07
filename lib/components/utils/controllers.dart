import 'package:flutter/material.dart';

TextEditingController loginEmail =  TextEditingController();
TextEditingController loginPassword =  TextEditingController();

GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();




TextEditingController signupName =  TextEditingController();
TextEditingController signupEmail =  TextEditingController();
TextEditingController signupPhone =  TextEditingController();
TextEditingController signupPassword =  TextEditingController();
TextEditingController signupConfirmpassword =  TextEditingController();

GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();


TextEditingController carOwnername = TextEditingController();
TextEditingController carOwnerPhone = TextEditingController();
TextEditingController carPrice = TextEditingController();
TextEditingController carColor = TextEditingController();
TextEditingController carKm = TextEditingController();
TextEditingController carYear = TextEditingController();
TextEditingController carInfo = TextEditingController();

GlobalKey<FormState> formstateAddCar = GlobalKey<FormState>();


TextEditingController priceFrom = TextEditingController();
TextEditingController priceTo   = TextEditingController();
TextEditingController yearFrom  = TextEditingController();
TextEditingController yearTo    = TextEditingController();

GlobalKey<FormState> searchform = GlobalKey<FormState>();


TextEditingController message = TextEditingController();

GlobalKey<FormState> chatForm = GlobalKey<FormState>();



//DROP DOWN CONTROLLERS

//ADD CAR
 String? brand;
 String? model;
 String? transimition;
 String? city;

//SEARCH PAGE
 String? searchBrand;
 String? searchModel;
 String? searchTransimition;
 String? searchCity;


 ScrollController chatScrollController = ScrollController();



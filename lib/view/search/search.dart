import 'package:arabity/components/functions.dart';
import 'package:arabity/components/widgets/textfield_widget.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/controllers.dart';
import 'searchedcar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var cities = [
    "Cairo",
    "Alexandria",
    "Al-Sharkia",
    "Aswan",
    "Luxor",
    "Al-Minoufia",
    "Al-Garbia",
    "Dakahlia",
    "North Sainai",
    "South Sainia",
    "PortSaid",
    "Dumait",
    "Ismailia",
    "Suiz",
    "Al-Minia",
    "Al-Qalubia",
    "Asuit",
    "Al-Fayoum",
    "Giza",
    "Hurgaida",
    "Kafr Al-Sheikh",
    "Al-Bahr Al-Ahmar",
  ];

  // var marks = [
  //   "Mercides",
  //   "BMW",
  //   "Ferrari",
  //   "Hundai",
  //   "Toyota",
  //   "Audi",
  //   "Dodge",
  //   "Peigout",
  //   "Lamburgini",
  //   "Geely",
  //   "BYD",
  //   "Pugatti",
  //   "Honda",
  //   "Jeep",
  //   "Chevorlet",
  //   "Ford",
  //   "KIA",
  //   "Fiat",
  //   "Suzouki",
  //   "Nissan",
  //   "Sang yong",
  //   "Skoda",
  //   "Lada",
  //   "Mazda",
  //   "Mitsubishu",
  //   "Obel",
  //   "Rino",
  //   "Jaguar",
  //   "Volkes wagn",
  //   "Subarou",
  //   "Alpha Romeo",
  //   "Siat",
  //   "Land Rover",
  //   "Jac",
  //   "Isuzu",
  //   "MG",
  //   "Mini",
  //   "Sheri",
  //   "Pourch",
  //   "Maziratti",
  //   "Aston Martin",
  //   "Volvo"
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "البحث",
              style: TextStyle(fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
                key: searchform,
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                      child: const Text(
                        "ابحث عن سيارتك المفضلة",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 20, bottom: 10),
                        child: const Text("ماركة السيارة : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: DropdownButton(
                          value: searchBrand,
                          items: cubit.brandsList.map((e) =>DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                          hint: const Text("ماركة السيارة"),
                          isExpanded: true,
                          onChanged: (dynamic item) {
                            setState(() {
                              searchBrand = item;
                              cubit.fillModelsList();
                              print(
                                  "$searchBrand $searchTransimition $searchCity");
                            });
                          }),
                    ),

                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 20),
                        child: const Text("الموديل : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),

                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: DropdownButton(
                        value: searchModel,
                        items: cubit.searchModelsList.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                        hint: const Text("Model"),
                        isExpanded: true,
                        onChanged: (dynamic item){setState(() {
                          searchModel = item;
                          print("$searchCity $searchTransimition $searchBrand $searchModel");
                        });}),
                    ),               

                    //  UnroundedTextFieldWidget(label: "الموديل", mycontroller: searchModel, myval: null, isPassword: false),

                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 20),
                        child: const Text("التعليق : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),

                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: DropdownButton(
                          value: searchTransimition,
                          items: ['manual', 'auto']
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text("$e")))
                              .toList(),
                          hint: const Text("التعليق"),
                          isExpanded: true,
                          onChanged: (item) {
                            setState(() {
                              searchTransimition = item;
                              print(
                                  "$searchBrand $searchTransimition $searchCity");
                            });
                          }),
                    ),

                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 20),
                        child: const Text("المدينة : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),

                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: DropdownButton(
                          value: searchCity,
                          items: cities.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                          hint: const Text("المدينة"),
                          isExpanded: true,
                          onChanged: (item) {
                            setState(() {
                              searchCity = item;
                              print(
                                  "$searchBrand $searchTransimition $searchCity");
                            });
                          }),
                    ),

                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 20),
                        child: const Text("السعر : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),

                    Row(
                      children: [
                        Expanded(
                            child: UnroundedTextFieldWidget(
                                label: "السعر من",
                                mycontroller: priceFrom,
                                myval: null,
                                isPassword: false)),
                        Expanded(
                            child: UnroundedTextFieldWidget(
                                label: "السعر الى",
                                mycontroller: priceTo,
                                myval: null,
                                isPassword: false)),
                      ],
                    ),
                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 10, top: 20),
                        child: const Text("السنة : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    Row(
                      children: [
                        Expanded(
                            child: UnroundedTextFieldWidget(
                                label: "السنة من",
                                mycontroller: yearFrom,
                                myval: null,
                                isPassword: false)),
                        Expanded(
                            child: UnroundedTextFieldWidget(
                                label: "السنة الى",
                                mycontroller: yearTo,
                                myval: null,
                                isPassword: false)),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: ElevatedButton(
                        child: const Text("Search"),
                        onPressed: () {
                          var formdata = searchform.currentState;
                          formdata!.save();
                          if (formdata.validate()) {
                            myPushNavigator(context, Searchedcar(
                                brand: searchBrand,
                                model: searchModel,
                                transimition: searchTransimition,
                                city: searchCity,
                                priceFrom: priceFrom.text,
                                priceTo: priceTo.text,
                                yearFrom: yearFrom.text,
                                yearTo: yearTo.text,
                              ));
                          } 
                        },
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
